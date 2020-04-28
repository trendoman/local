#! /bin/bash

# https://www.digitalocean.com/community/tutorials/how-to-install-git-on-ubuntu-18-04

APP="git"

echo "Preparing ${APP} installation ..."
# Update the list of packages
sudo apt update

sudo apt install -y $APP
echo "Successfully installed $(${APP} --version) ..."

echo -e "Adding useful alias entries for ${APP} ..."
echo -e "\n# alias GIT" >> ~/.bashrc
echo -e "alias g='git'" >> ~/.bashrc
echo -e "alias gs='git status'" >> ~/.bashrc
echo -e "alias ga='git add'" >> ~/.bashrc
echo -e "alias gaa='git add -A'" >> ~/.bashrc
echo -e "alias gau='git add -u'" >> ~/.bashrc
echo -e "alias gb='git branch | grep \*'" >> ~/.bashrc
echo -e "alias gc='git commit -m'" >> ~/.bashrc
echo -e "alias gl='git log --oneline --abbrev-commit -6'" >> ~/.bashrc
echo -e "alias glm='git fetch && git log master..origin/master'" >> ~/.bashrc # See which commits are on remote "origin/master" but not yet on "master"
echo -e "alias gpull='git pull'" >> ~/.bashrc
echo -e "alias gpush='git push'" >> ~/.bashrc
echo -e "alias gpush_='ga -A && gc \$(sr) && gpush'" >> ~/.bashrc

git config --global http.sslverify false
echo "Write your git user.name"; read USR_N; git config --global user.name $USR_N
echo "Write your git user.email"; read USR_E; git config --global user.email $USR_E
echo "Write your git user.password"; read USR_P; git config --global user.password $USR_P

# eval "$(ssh-agent -s)" && ssh-add ~/.ssh/id_rsa_xxx # Use when ssh-agent was stopped


