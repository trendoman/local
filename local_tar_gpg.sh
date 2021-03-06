#! /bin/bash
set -e

GIT_URL="git@github.com:inesyra/local.git"
DIR_FILES=~/Documents/\.tmp_gpg
DIR_OUTPUT=~/Documents/\.tmp_gpg_output
DIR_SOURCE=$(pwd)
CUR=$(pwd)


STR_RAND=$(openssl rand -hex 23)
STR_DATE=$(echo $(date +'%Y-%m-%d-%H%M') | awk '{print substr($0,1,14) }')
STR_ID="$STR_RAND $STR_DATE"


TAR="local"
TAR_FILE="${TAR}.tar.gz.gpg"


# $ sudo ./file.sh -o encrypt -n foo -d /media/geovra/Kingston/Drive/local;
# $ sudo ./file.sh -o decrypt -n foo;
OPE="encrypt"
SSH=0;
while getopts 'o:n:d:s:' c
do
  case $c in
    o) OPE=$OPTARG ;;
    n) TAR=$OPTARG ;;
    d) DIR_SOURCE=$OPTARG ;;
    s) SSH=$OPTARG ;;
  esac
done


if [ "$CUR" != "$DIR_SOURCE" ]; then
  CUR="$DIR_SOURCE"
fi


encrypt()
{
  rm -rf $DIR_FILES && mkdir -p $DIR_FILES
  rm -rf $DIR_OUTPUT && mkdir -p $DIR_OUTPUT

  # With owner and group: rlptgoDP; -v verbose
  echo -e "=> Copying files from $DIR_SOURCE to $DIR_FILES"
  # ... rsync -av -f '- */' -f '- *.zip' -f '- local.tar.gz.gpg' --no-links "$DIR_SOURCE/" "$DIR_FILES/"
  rsync -a -f '- */' -f '- *.zip' -f '- local.tar.gz.gpg' -f '- *.*.junk' -f '- *.junk' --no-perms --omit-dir-times "$DIR_SOURCE/" "$DIR_FILES/" 
  rsync -a --no-perms --omit-dir-times "$DIR_SOURCE/env/" "$DIR_FILES/env/" || true # ... rsync -av --no-links "$DIR_SOURCE/env/" "$DIR_FILES/env/"
  rsync -a --no-perms --omit-dir-times "$DIR_SOURCE/notes/" "$DIR_FILES/notes/" || true

  readme_update "$DIR_FILES/README.md"

  # symlinks_copy $DIR_FILES

  cd $DIR_FILES
  TAR_FILE_TEMP="$(openssl rand -hex 10).tar.gz.gpg"

  # This is the most secure way to create password protected archives; the archive is piped to gpg for encryption and password protection.
  echo -e "=> Writing archive to: $DIR_OUTPUT/$TAR_FILE_TEMP"
  tar czpf - * | gpg --symmetric --cipher-algo aes256 --batch --passphrase "${PAS}" -o "$DIR_OUTPUT/$TAR_FILE_TEMP"

  echo -e "=> Copying to path: $DIR_SOURCE/$TAR_FILE"
  cp -f "$DIR_OUTPUT/$TAR_FILE_TEMP" "$DIR_SOURCE/$TAR_FILE"
  # echo -e "=> Copying to path: $CUR/$TAR_FILE"
  cp -f "$DIR_OUTPUT/$TAR_FILE_TEMP" "$CUR/$TAR_FILE"

  rm -rf $DIR_FILES
  rm -rf $DIR_OUTPUT
  echo -e "=> Writing archive completed"
}


decrypt()
{
  DEST="$DIR_SOURCE/backup/local/${STR_DATE}_$(openssl rand -hex 6)" # Temporary directory
  mkdir -p $DEST
  echo -e "=> Extracting file: " "\n""... From: $DIR_SOURCE/$TAR_FILE" "\n""... To: $DEST"
  gpg --batch --passphrase "${PAS}" -d "$DIR_SOURCE/$TAR_FILE" | tar -C "$DEST" -xzf -

  TIMESTAMP=$(grep -n "Updated " "$DEST/README.md" | awk '{print $2}')
  DEST_NORMALIZED="$DIR_SOURCE/backup/local/$TIMESTAMP"
  mv $DEST $DEST_NORMALIZED

  backup_dir_source $DEST_NORMALIZED
}


backup_dir_source()
{
  # TODO Backup $DIR_SOURCE and move contents from $DEST_NORMALIZED into $DIR_SOURCE (overwrite existing files)
  DIR_TMP="$1_$(openssl rand -hex 6)_backup/"
  echo -e "=> Creating backup for $DIR_SOURCE at location $DIR_TMP"
  rsync -a -f '- */' -f '+ env/' -f '+ notes/' -f '- *.zip' --no-perms --omit-dir-times "$DIR_SOURCE/" $DIR_TMP
  rsync -a --no-perms --omit-dir-times "$DIR_SOURCE/env/" "$DIR_TMP/env/" || true # ... rsync -av --no-links "$DIR_SOURCE/env/" "$DIR_FILES/env/"
  rsync -a --no-perms --omit-dir-times "$DIR_SOURCE/notes/" "$DIR_TMP/notes/" || true

  echo -e "\e[32m=> Updating files in $DIR_SOURCE\e[0m"
  rsync -a --no-links --no-perms --omit-dir-times "$1/" "$DIR_SOURCE/"
}


symlinks_copy()
{
  echo ""
#   sudo tee -a "$1/.symlinks_copy" <<EOF
#   _scribble=/var/xxx
#   _timeline=/var/yyy
#
# EOF
}


git_add_files()
{
  cd "$DIR_SOURCE"
  git rm --cached "local.tar.gz.gpg" &>/dev/null || true
  git rm --cached "env/var/*.tar" &>/dev/null || true
  git rm --cached "env/var/*.*.*.*.tar" &>/dev/null || true
  git add -f "$TAR_FILE"
  git add -f "local_tar_gpg.sh"
  git add -f "env/" || true
  git add -f "notes/" || true
  git add -f ".gitignore" || true
  git add -f "README.md"
}


git_push()
{
  git init &>/dev/null # Cover edge case when the .git folder has been deleted in order to "RESET" the remote repo. For current usage, removing the git history is absolutely fine.
  
  encrypt

  TAR="local"

  # $ sudo ./file.sh ... -n foo;
  while getopts 'n:' c
  do
    case $c in
      n) TAR=$OPTARG ;;
    esac
  done

  cd $CUR
  readme_update "$CUR/README.md"

  # echo "SSH is set to '$var'";
  if [ $SSH = '1' ]; then
    git_ssh
  fi

  echo -e "=> Creating backup for remote"
  git_remote_backup_before_push

  echo -e "=> Uploading file $TAR_FILE to $GIT_URL"
  git reset &>/dev/null
  git_add_files
  git commit -m "$STR_RAND" &>/dev/null
  echo -e "=> Pushing changes to remote"
  git push -f --set-upstream $GIT_URL master &>/dev/null
  echo -e "$(_g 'Exit code 0')"
}


git_pull()
{
  rm -rf "$DIR_FILES"
  # echo "SSH is set to '$var'";
  if [ $SSH = '1' ]; then
    git_ssh
  fi

  git clone "$GIT_URL" "$DIR_FILES"

  # ... 500 Ignores env/ directory
  cp "$DIR_FILES/$TAR_FILE" "$DIR_SOURCE/$TAR_FILE"
  cp "$DIR_FILES/$TAR_FILE" "$CUR/$TAR_FILE"
  rm -rf $DIR_FILES

  decrypt
  echo -e "\e[32mExit code 0\e[0m"
}


git_ssh()
{
  # Start the ssh-agent in the background: ... Agent pid 59566
  eval "$(ssh-agent -s)" 1>/dev/null

  # Add your SSH private key to the ssh-agent. If you created your key with a different name, or if you are adding an existing key that has a different name, replace id_rsa in the command with the name of your private key file.
  ssh-add ~/.ssh/id_rsa_home_dell 2>/dev/null || cat /dev/null
  ssh-add ~/.ssh/id_rsa_home_secondary 2>/dev/null || cat /dev/null
  # ssh-add ~/.ssh/id_rsa_GITLAB_SB 1>/dev/null 2&1 || cat /dev/null
}


git_remote_backup_before_push()
{
  # Useful when you forget to pull changes before pushing
  STR_DATE=$( echo $(date +'%Y-%m-%d-%H%M%S') )
  DEST_REMOTE_BACKUP="$CUR/backup/local/${STR_DATE}-remote-before-push"

  git clone -q --depth 1 --branch master "$GIT_URL" "$DEST_REMOTE_BACKUP"
  rm -rf "$DEST_REMOTE_BACKUP/.git/" # Optional: remove .git folder from the backup contents
}


readme_update()
{
  echo "=> Updating README file at: $1"
  sed -i "s/Updated .*/Updated $STR_DATE/g" $1
}


# echo -e "Hello, $(_r 'Lisa')!"
_r() { echo -e "\e[91m$1\e[0m"; }
_g() { echo -e "\e[92m$1\e[0m"; }
_y() { echo -e "\e[93m$1\e[0m"; }
_b() { echo -e "\e[94m$1\e[0m"; }
_m() { echo -e "\e[95m$1\e[0m"; }


# <file.sh> -o push -n <name>
if [ $OPE = "push" ]; then
  git_push
fi


# <file.sh> -o pull -n <name>
if [ $OPE = "pull" ]; then
  git_pull
fi


# <file.sh> -o encrypt [-n <name>]
if [ $OPE = "encrypt" ]; then
  encrypt
fi


# <file.sh> -o decrypt [-n <name>]
if [ $OPE = "decrypt" ]; then
  decrypt
fi


# <file.sh> -o readme
if [ $OPE = "readme" ]; then
  readme
fi


# <file.sh> -o ssh
if [ $OPE = "ssh" ]; then
  git_ssh
fi


# <file.sh> -o rm
if [ $OPE = "rm" ]; then
  echo "\e[33m=> Removing folders __local__ and $( echo $(date +'%Y-%m-%d-%H') | awk '{print substr($0,1,14) }' )\e[0m"
  rm -rf "$( echo $(date +'%Y-%m-%d-%H') | awk '{print substr($0,1,14) }' )/"
  rm -rf  "__local__/"
fi

# <file.sh> -o rm
if [ $OPE = "git:fetch" ]; then
  echo -e "\e[33mFetching git output\e[0m"
  OUT=$(git fetch | grep -i "HEAD")

  if [[ $OUT == *"HEAD"* ]]; then
    echo -e "Found differences in remote"
    echo -e $OUT
  fi
fi
