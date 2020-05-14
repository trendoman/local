```html
// -*- grammar-ext: .cs -*-


'SCRIBBLE'

 o NULL


 	o

 	forks will copy a repo inside your repo collection
 	it gives the copy repo a new https address
 	so you can clone the new repository to the local machine and work on it

 	88888

 	git clone https://github.com/inesyra/learningGit.git
 	will create a local folder with everything inside the repository

 	git push origin master
 	pushes into the origin or repository the master branch inside the active folder

 	git pull
 	to return retrieve all changes made from others inside the repository
 	sort of an update of the local version to match the repo, it will update the file contents & commit points with their respective id and names

 	88888

 	git checkout master
 	git merge addCategories 'which is the name of the branch you want to merge'
 	and that is it

 	git branch -d addCategories
 	then what you can do is delete the branch that you do not need anymore

 	o

 	git checkout -b addCategories
 	creating a new branch

 	git checkout master
 	checkout swithces bw branches; this will go to the master branch

 	ooo

 	git reset a5d947073a51ead41ac3305a7c5a29380a9c9dce
 	the HEAD at given id is removed
 	the status of the file is modified BUT not commited
 	the file contains the info added at this id, just that it has not been commited
 	if the id here was for "Added feature 3", after the reset the file will contain all features: 1, 2, and 3
 	'this is a soft reset'

 	ooo

 	git reset --hard e2145fc500918df485b9784b21803550a806cb43
 	the HEAD at given id is removed
 	the HEAD will be at the next earlier position
 	the file does NOT contain the info added at this id, it is in the form in which it was commited at the next earlier id / HEAD
 	if the id here was for "Added feature 3", after the reset the file will only contain prior features 1 and 2
 	'this is a hard reset'

 	ooo

 	git add .
 	git commit -m "Added feature 1 to file"
 	will record the time when you added that specific feature / part and give it and id number
 	-m flag is used to set a small description / message

 	if then you modify a file that is being watched by git
 	git status will show modified: index.php

 	ooo

 	git add .
 	will add the entire directory you are in

 	git add index.php
 	will add a file to the repository;
 	git status will show new file: index.php

 	git status
 	for information about the status, simply

 	o

 	git config --global user.name "Lisa"
 	git config --global user.email "xxx@home.xxx"

 	o

 	type nul > file.txt = make a file
 	md / mkdir = make directories
 	rd / rmdir = remove directory
 	rmdir /S folder = remove dir with files inside
 	delete / del = delete files
 	cls
 	dir /A /B = list files and folders
 	dir /A:H /B = list hidden files and folders
 	edit file.txt
 	copy file1.txt file2.txt
 	rename file1.txt file2.txt
 	del file.txt

 o var
    git pull origin master
  	git checkout -b dev-foo
  	// Assume at least n commits



    CONVENTIONAL COMMITS

      // Summary
      //
      // The Conventional Commits specification is a lightweight convention on top of commit messages. It provides an easy set of rules for creating an explicit commit history; which makes it easier to write automated tools on top of. This convention dovetails with SemVer, by describing the features, fixes, and breaking changes made in commit messages.
      //
      // The commit message should be structured as follows:
      // <type>[optional scope]: <description>
      //
      // [optional body]
      // [optional footer]

      // The commit contains the following structural elements, to communicate intent to the consumers of your library:
      //     fix: a commit of the type fix patches a bug in your codebase (this correlates with PATCH in semantic versioning).
      //     feat: a commit of the type feat introduces a new feature to the codebase (this correlates with MINOR in semantic versioning).
      //     BREAKING CHANGE: a commit that has the text BREAKING CHANGE: at the beginning of its optional body or footer section introduces a breaking API change (correlating with MAJOR in semantic versioning). A BREAKING CHANGE can be part of commits of any type.
      //     Others: commit types other than fix: and feat: are allowed, for example @commitlint/config-conventional (based on the Angular convention) recommends chore:, docs:, style:, refactor:, perf:, test:, and others.

      // We also recommend improvement for commits that improve a current implementation without adding a new feature or fixing a bug. Notice these types are not mandated by the conventional commits specification, and have no implicit effect in semantic versioning (unless they include a BREAKING CHANGE).
      // A scope may be provided to a commit’s type, to provide additional contextual information and is contained within parenthesis, e.g., feat(parser): add ability to parse arrays.

      // Examples
      // Commit message with description and breaking change in body
      //
      // feat: allow provided config object to extend other configs
      //
      // BREAKING CHANGE: `extends` key in config file is now used for extending other config files
      //
      // Commit message with optional ! to draw attention to breaking change
      //
      // chore!: drop Node 6 from testing matrix
      //
      // BREAKING CHANGE: dropping Node 6 which hits end of life in April
      //
      // Commit message with no body
      //
      // docs: correct spelling of CHANGELOG
      //
      // Commit message with scope
      //
      // feat(lang): add polish language
      //
      // Commit message for a fix using an (optional) issue number.
      //
      // fix: correct minor typos in code
      //
      // see the issue for details on the typos fixed
      //
      // closes issue #12

      // Specification
      //
      // The key words “MUST”, “MUST NOT”, “REQUIRED”, “SHALL”, “SHALL NOT”, “SHOULD”, “SHOULD NOT”, “RECOMMENDED”, “MAY”, and “OPTIONAL” in this document are to be interpreted as described in RFC 2119.
      //
      //     Commits MUST be prefixed with a type, which consists of a noun, feat, fix, etc., followed by an OPTIONAL scope, and a REQUIRED terminal colon and space.
      //     The type feat MUST be used when a commit adds a new feature to your application or library.
      //     The type fix MUST be used when a commit represents a bug fix for your application.
      //     A scope MAY be provided after a type. A scope MUST consist of a noun describing a section of the codebase surrounded by parenthesis, e.g., fix(parser):
      //     A description MUST immediately follow the space after the type/scope prefix. The description is a short summary of the code changes, e.g., fix: array parsing issue when multiple spaces were contained in string.
      //     A longer commit body MAY be provided after the short description, providing additional contextual information about the code changes. The body MUST begin one blank line after the description.
      //     A footer of one or more lines MAY be provided one blank line after the body. The footer MUST contain meta-information about the commit, e.g., related pull-requests, reviewers, breaking changes, with one piece of meta-information per-line.
      //     Breaking changes MUST be indicated at the very beginning of the body section, or at the beginning of a line in the footer section. A breaking change MUST consist of the uppercase text BREAKING CHANGE, followed by a colon and a space.
      //     A description MUST be provided after the BREAKING CHANGE:, describing what has changed about the API, e.g., BREAKING CHANGE: environment variables now take precedence over config files.
      //     Types other than feat and fix MAY be used in your commit messages.
      //     The units of information that make up conventional commits MUST NOT be treated as case sensitive by implementors, with the exception of BREAKING CHANGE which MUST be uppercase.
      //     A ! MAY be appended prior to the : in the type/scope prefix, to further draw attention to breaking changes. BREAKING CHANGE: description MUST also be included in the body or footer, along with the ! in the prefix.

      // Why Use Conventional Commits
      //
      //     Automatically generating CHANGELOGs.
      //     Automatically determining a semantic version bump (based on the types of commits landed).
      //     Communicating the nature of changes to teammates, the public, and other stakeholders.
      //     Triggering build and publish processes.
      //     Making it easier for people to contribute to your projects, by allowing them to explore a more structured commit history.


    LOG
      // git log accepts two refs and returns only the logs between them. Example refs: version-2 (which is a tag bame), 0dc7gb82 (commit hash), HEAD (reserved word)
      git log <ref-1>..<ref-2>
      git log version-2..HEAD


    TAG
      https://git-scm.com/book/en/v2/Git-Basics-Tagging

      // Mark or tag one commit with a custom text message
      git tag -f -a [-m <message_here>] <actual_tag> [<commit_hash_to_be_tagged>]
      git tag -f -a -m "EXTRA MESSAGE HERE" "CHANGELOG.md" fb5f35d205e28c2c33df99a8e8837c5a68c96794

      // Reads the latest tag => CHANGELOG.md-0-g50df655 => <tag>-<number_of_refs_from_latest_tag_until_now>-<commit_hash_abbreviation_of_current_head>
      git describe --long

      // Lists tags LIKE given pattern
      git tag -l "v1.8.5*"

   	git pull origin master
  	git checkout -b dev-foo
  	// Assume at least n commits

 o CONVENTIONAL COMMITS

    // Conventional Commits 1.0.0
    //
    // Summary
    //
    // ... chore: Small task,
    // ... style: Changes that do not affect the meaning of the code (white-space, formatting, missing semi-colons, etc)
    // ... build: Changes that affect the build system or external dependencies (example scopes: gulp, broccoli, npm)
    // ... ci: Changes to our CI configuration files and scripts (example scopes: Travis, Circle, BrowserStack, SauceLabs)
    // ... docs: Documentation only changes
    // ... feat: A new feature
    // ... fix: A bug fix
    // ... perf: A code change that improves performance
    // ... refactor: A code change that neither fixes a bug nor adds a feature
    // ... revert: For undo operations,
    // ... test: Adding missing tests or correcting existing tests
    //
    // The Conventional Commits specification is a lightweight convention on top of commit messages. It provides an easy set of rules for creating an explicit commit history; which makes it easier to write automated tools on top of. This convention dovetails with SemVer, by describing the features, fixes, and breaking changes made in commit messages.
    //
    // The commit message should be structured as follows:
    // <type>[optional scope]: <description>
    //
    // [optional body]
    //
    // [optional footer(s)]
    //
    // The commit contains the following structural elements, to communicate intent to the consumers of your library:
    //
    //     fix: a commit of the type fix patches a bug in your codebase (this correlates with PATCH in semantic versioning).
    //     feat: a commit of the type feat introduces a new feature to the codebase (this correlates with MINOR in semantic versioning).
    //     BREAKING CHANGE: a commit that has a footer BREAKING CHANGE:, or appends a ! after the type/scope, introduces a breaking API change (correlating with MAJOR in semantic versioning). A BREAKING CHANGE can be part of commits of any type.
    //     types other than fix: and feat: are allowed, for example @commitlint/config-conventional (based on the the Angular convention) recommends build:, chore:, ci:, docs:, style:, refactor:, perf:, test:, and others.
    //     footers other than BREAKING CHANGE: <description> may be provided and follow a convention similar to git trailer format.
    //
    // Additional types are not mandated by the conventional commits specification, and have no implicit effect in semantic versioning (unless they include a BREAKING CHANGE).
    //
    // A scope may be provided to a commit’s type, to provide additional contextual information and is contained within parenthesis, e.g., feat(parser): add ability to parse arrays.
    //
    // Examples
    // Commit message with description and breaking change footer
    //
    // feat: allow provided config object to extend other configs
    //
    // BREAKING CHANGE: `extends` key in config file is now used for extending other config files
    //
    // Commit message with ! to draw attention to breaking change
    //
    // refactor!: drop support for Node 6
    //
    // Commit message with both ! and BREAKING CHANGE footer
    //
    // refactor!: drop support for Node 6
    //
    // BREAKING CHANGE: refactor to use JavaScript features not available in Node 6.
    //
    // Commit message with no body
    //
    // docs: correct spelling of CHANGELOG
    //
    // Commit message with scope
    //
    // feat(lang): add polish language
    //
    // Commit message with multi-paragraph body and multiple footers
    //
    // fix: correct minor typos in code
    //
    // see the issue for details
    //
    // on typos fixed.
    //
    // Reviewed-by: Z
    // Refs #133
    //
    // Specification
    //
    // The key words “MUST”, “MUST NOT”, “REQUIRED”, “SHALL”, “SHALL NOT”, “SHOULD”, “SHOULD NOT”, “RECOMMENDED”, “MAY”, and “OPTIONAL” in this document are to be interpreted as described in RFC 2119.
    //
    //     Commits MUST be prefixed with a type, which consists of a noun, feat, fix, etc., followed by the OPTIONAL scope, OPTIONAL !, and REQUIRED terminal colon and space.
    //     The type feat MUST be used when a commit adds a new feature to your application or library.
    //     The type fix MUST be used when a commit represents a bug fix for your application.
    //     A scope MAY be provided after a type. A scope MUST consist of a noun describing a section of the codebase surrounded by parenthesis, e.g., fix(parser):
    //     A description MUST immediately follow the colon and space after the type/scope prefix. The description is a short summary of the code changes, e.g., fix: array parsing issue when multiple spaces were contained in string.
    //     A longer commit body MAY be provided after the short description, providing additional contextual information about the code changes. The body MUST begin one blank line after the description.
    //     A commit body is free-form and MAY consist of any number of newline separated paragraphs.
    //     One or more footers MAY be provided one blank line after the body. Each footer MUST consist of a word token, followed by either a :<space> or <space># separator, followed by a string value (this is inspired by the git trailer convention).
    //     A footer’s token MUST use - in place of whitespace characters, e.g., Acked-by (this helps differentiate the footer section from a multi-paragraph body). An exception is made for BREAKING CHANGE, which MAY also be used as a token.
    //     A footer’s value MAY contain spaces and newlines, and parsing MUST terminate when the next valid footer token/separator pair is observed.
    //     Breaking changes MUST be indicated in the type/scope prefix of a commit, or as an entry in the footer.
    //     If included as a footer, a breaking change MUST consist of the uppercase text BREAKING CHANGE, followed by a colon, space, and description, e.g., BREAKING CHANGE: environment variables now take precedence over config files.
    //     If included in the type/scope prefix, breaking changes MUST be indicated by a ! immediately before the :. If ! is used, BREAKING CHANGE: MAY be ommitted from the footer section, and the commit description SHALL be used to describe the breaking change.
    //     Types other than feat and fix MAY be used in your commit messages, e.g., docs: updated ref docs.
    //     The units of information that make up conventional commits MUST NOT be treated as case sensitive by implementors, with the exception of BREAKING CHANGE which MUST be uppercase.
    //     BREAKING-CHANGE MUST be synonymous with BREAKING CHANGE, when used as a token in a footer.
    //
    // Why Use Conventional Commits
    //
    //     Automatically generating CHANGELOGs.
    //     Automatically determining a semantic version bump (based on the types of commits landed).
    //     Communicating the nature of changes to teammates, the public, and other stakeholders.
    //     Triggering build and publish processes.
    //     Making it easier for people to contribute to your projects, by allowing them to explore a more structured commit history.
    //
    // FAQ
    // How should I deal with commit messages in the initial development phase?
    //
    // We recommend that you proceed as if you’ve already released the product. Typically somebody, even if it’s your fellow software developers, is using your software. They’ll want to know what’s fixed, what breaks etc.
    // Are the types in the commit title uppercase or lowercase?
    //
    // Any casing may be used, but it’s best to be consistent.
    // What do I do if the commit conforms to more than one of the commit types?
    //
    // Go back and make multiple commits whenever possible. Part of the benefit of Conventional Commits is its ability to drive us to make more organized commits and PRs.
    // Doesn’t this discourage rapid development and fast iteration?
    //
    // It discourages moving fast in a disorganized way. It helps you be able to move fast long term across multiple projects with varied contributors.
    // Might Conventional Commits lead developers to limit the type of commits they make because they’ll be thinking in the types provided?
    //
    // Conventional Commits encourages us to make more of certain types of commits such as fixes. Other than that, the flexibility of Conventional Commits allows your team to come up with their own types and change those types over time.
    // How does this relate to SemVer?
    //
    // fix type commits should be translated to PATCH releases. feat type commits should be translated to MINOR releases. Commits with BREAKING CHANGE in the commits, regardless of type, should be translated to MAJOR releases.
    // How should I version my extensions to the Conventional Commits Specification, e.g. @jameswomack/conventional-commit-spec?
    //
    // We recommend using SemVer to release your own extensions to this specification (and encourage you to make these extensions!)
    // What do I do if I accidentally use the wrong commit type?
    // When you used a type that’s of the spec but not the correct type, e.g. fix instead of feat
    //
    // Prior to merging or releasing the mistake, we recommend using git rebase -i to edit the commit history. After release, the cleanup will be different according to what tools and processes you use.
    // When you used a type not of the spec, e.g. feet instead of feat
    //
    // In a worst case scenario, it’s not the end of the world if a commit lands that does not meet the conventional commit specification. It simply means that commit will be missed by tools that are based on the spec.
    // Do all my contributors need to use the conventional commit specification?
    //
    // No! If you use a squash based workflow on Git lead maintainers can clean up the commit messages as they’re merged—adding no workload to casual committers. A common workflow for this is to have your git system automatically squash commits from a pull request and present a form for the lead maintainer to enter the proper git commit message for the merge.
    // How does Conventional Commits handle revert commits?
    //
    // Reverting code can be complicated: are you reverting multiple commits? if you revert a feature, should the next release instead be a patch?
    //
    // Conventional Commits does not make an explicit effort to define revert behavior. Instead we leave it to tooling authors to use the flexility of types and footers to develop their logic for handling reverts.
    //
    // One recommendation is to use the revert type, and a footer that references the commit SHAs that are being reverted:
    //
    // revert: let us never again speak of the noodle incident
    //
    // Refs: 676104e, a215868

 \0


'CHECKOUT'

  RESTORE DELETED FILE
    
  	git ls-files --deleted
  	git checkout <path/to/deleted/file.ext> // This will restore the deleted file.


'ADD'

  TLDR

    // Used to add files to the local repo before a commit operation.
    // Without add there would be nothing to commit.

    $ pwd /* /Home/dev/php/project_foo */
    $ git add . /* Adds all the files in project_foo */
    $ git add src/ /* Adds all the files in project_foo/src. Useful for adding files on a by folder basis */
    $ git status
    // ... new file: src/utils/bar.php
    // ... new file: src/utils/baz.php
    // ... Itc, 2 new files were added in the ~/src/utils folder
    $ git commit -a
    // ... Added bar and baz files to project

  STAGING AREA

    // Add single file
    $ git add foo.txt
    $ git add bar.txt

    // Remove or unstages a single file
    $ git remove --cached bar.txt

	// Only modified or touched files
	$ git add -u

	// Modified and untracked or unstaged files
	$ git add -A

  // You can also specify file names with git add c a mmand to add specific file. Use the following example command to add README by specifying names.
  // $ git add index.html README
	// $ git add [FILENAMES]
  // $ git add Documents/\*.txt // Also, you can use wildcard names to add files. For example to add all the files with the .txt extension from Documents directory.

  // You can also specify dot (.) to add all the files, directories, and sub-directories. This is useful while adding multiple files.
  // $ git add .

	// This option doesn’t actually add the file(s). You can use -n or --dry-run to test files if they exist and/or will be ignored with git add command.
  // $ git add . --dry-run

  REMOVE
    // Useful for removing specific files before a commit operation

    $ git rm src/utils/bar.php
    $ git status
    // ... new file: src/utils/baz.php
    $ git commit -a
    // ... Added baz file to project


'COMMIT'

  TLDR
    // The commit action moves the files added to the staging area into the local repository.
    // Flow: change files in working directory > git add to staging area > git commit to local repository.

    // To do anything useful in Git, you first need one or more commits in your repository. A
    // commit is created from the changes to one or more files on disk. The typical workflow
    // is that you’ll change the contents of files in a repository, review the diffs, add them to
    // the index, create a new commit from the contents of the index, and repeat this cycle.

    // Outline
    $ git add . // Add all the files
    $ git commit -m "message goes here" // Commit the changes
    $ git status // Check status change
    $ git log --oneline // Inspect the list of commits in simple form
    $ git log // Inspect the list of commits in extended form

    // Now we can add files and make the first commit:
    $ cd D:/Local/xammp/htdocs/php_with_symphony

    $ git add .
    // adds all the files in the active directory to the repository

    $ git status
    // shows info about what files changed and need to be committed

    // Creating a  commit stores the changes to one or more files. Each commit contains a
    // message entered by the author, details of the commit author, a unique commit refer-
    // ence (in Git, SHA-1 hashes such as 86bb0d659a39c98808439fadb8dbd594bec0004d) a
    // pointer to the preceding commit (known as the parent commit), the date the commit
    // was created, and a pointer to the contents of files when the commit was made.
    $ git commit --message "first commit message goes here" // The --message flag for git commit can be abbreviated to -m (all abbreviations use a single -)
    $ git commit -m "first commit message goes here"
    // creates a new commit

    // [master (root-commit) 6576b68] first commit message goes here=
    // 1 file changed, 2 insertions(+)
    // create mode 100644 ...

    $ git commit --all --message "second commit here"
    $ git commit -a -m "second commit here"
    // git commit can be called with a path (like git add) to do the equivalent of an add
    // followed immediately by a commit. It can also take the --all (or -a) flag to add all
    // changes to files tracked in the repository into a new commit. Although these methods
    // all save time, they tend to result in larger (and therefore worse) commits.

    $ git status
    // ... After a commit, the status changes to: Nothing to commit, working tree clean

    $ git log
    // ... Lists all commits performed with their hash, branch name, and message
    // ... ... commit 0987612345098765 (HEAD -> master)
    // ... ... first commit message here

    // Parent commits
    // Every commit object points to its parent commit. The parent commit in a linear, branch-
    // less history is the one that immediately preceded it. The only commit that lacks a par-
    // ent commit is the  initial commit: the first commit in the repository. By following the
    // parent commit, its parent, its parent, and so on, you can always get back from the cur-
    // rent commit to the initial commit.

    'WHY ARE SMALL COMMITS BETTER?'
      // Sometimes it’s desirable to pick only some changed files (or even some changed lines
      // within files) to include in a commit and leave the other changes to be added in a future
      // commit. Commits should be kept as small as possible. This allows their message to describe
      // a single change rather than multiple changes that are unrelated but were worked
      // on at the same time. Small commits keep the history readable; it’s easier when
      // looking at a small commit in the future to understand exactly why the change
      // was made. If a small commit is later found to be undesirable, it can be easily
      // reverted. This is much more difficult if many unrelated changes are clumped
      // together into a single commit and you wish to revert a single change.

    'REFS'

      // In Git, refs are the possible ways of addressing  individual commits. They’re an easier
      // way to refer to a specific commit or branch when specifying an argument to a Git
      // command.

      // The first ref you’ve already seen is a branch (which is master by default if you
      // haven’t created any other branches). Branches are pointers to specific commits. Ref-
      // erencing the branch name master is the same as referencing the SHA-1 of the commit
      // at the top of the master branch, such as the short SHA-1 6b437c7 in the last example.
      // Whenever you might type 6b437c7 in a command, you can instead type master, and
      // vice versa. Using branch names is quicker and easier to remember for referencing
      // commits than always using SHA-1s.

      // Refs can also have modifiers appended. Suffixing a ref with ~1 is the same as saying
      // “one commit before that ref.” For example, master~1 is the penultimate commit on the
      // master branch: the short SHA-1 6576b68 in the last example. Another equivalent syntax
      // is master^, which is the same as master~1 (and master^^ is equivalent to master~2).

      // The second ref is the string HEAD. HEAD always points to the top of whatever you cur-
      // rently have checked out, so it’s almost always the top commit of the current branch
      // you’re on. If you have the master branch checked out, then master and HEAD (and
      // 6b437c7 in the last example) are equivalent.

	COMMIT and PUSH

	 	$ git commit -m "lorem ipsum ..." // IN LOCAL REPO
		$ git push <remote> <branch> // IN REMOTE REPO

    ; // GENERAL FLOW
      $ git status
      $ git add -A
      $ git checkout -b dev-00x
      $ git push origin dev-00x
      $ git commit -m "..."
      $ git push origin dev-00x

  AMEND

    git commit --amend -m "Initial Commit" ... // Sometimes, you can make mistakes while writing a commit message. To change the message of the previous commit, use the following command.

    git add -A && git commit --amend ... // To add this file to the previous commit, we need to first stage it using git add -A and then use git commit --amend. It will open vim editor or whatever terminal editor is at your disposal like below.
    git add -A && git commit --amend --no-edit ... // You can avoid edit message dialog like above by passing extra --no-edit flag like git commit --amend --no-edit.

  CHERRY PICK

    // CHERRY-PICKING SPECIFIC COMMITS FROM ANOTHER BRANCH
    //
    // %TLDR
    //
    // Let’s say you’ve written some code in commit 62ecb3 of some feature branch that is very important right now. It may contain a bug fix or code that other people need to have access to now. Whatever the reason, you want to have commit 62ecb3 in the master branch right now, but not the other code you’ve written in the feature branch.
    // In this case, 62ecb3 is the cherry and this is how you pick it!
    //
    // git checkout master
    // git cherry-pick 62ecb3
    //
    // That’s all.
    // 62ecb3 is now applied to the master branch and commited (as a new commit) in master.
    // cherry-pick behaves just like merge; if git can’t apply the changes (e.g. you get merge conflicts), git leaves you to resolve the conflicts manually and make the commit yourself.
    //
    // \0
    //
    // %TLDR
    //
    // I’m often asked how to merge only specific commits from another branch into the current one. The reason you’d want to do this is to merge specific changes you need now, leaving other code changes you’re not interested in right now behind.
    // First of all, use git log or the awesome GitX tool to see exactly which commit you want to pick. An example:
    // dd2e86 - 946992	- 9143a9 - a6fd86 - 5a6057 [master]
    //            \
    //             76cada - 62ecb3	- b886a0 [feature]
    // Let’s say you’ve written some code in commit 62ecb3 of some feature branch that is very important right now. It may contain a bug fix or code that other people need to have access to now. Whatever the reason, you want to have commit 62ecb3 in the master branch right now, but not the other code you’ve written in the feature branch.
    // In this case, 62ecb3 is the cherry and you want to pick it!
    //
    // Here comes git cherry-pick.
    //
    // git checkout master
    // git cherry-pick 62ecb3
    //
    // Posted: 2010-06-10 https://www.devroom.io/2010/06/10/cherry-picking-specific-commits-from-another-branch/

    // CHERRY PICKING A RANGE OF COMMITS
    //
    // In some cases picking one single commit is not enough. You need, let’s say three consecutive commits. cherry-pick is not the right tool for this. rebase is. From the previous example, you’d want commit 76cada and 62ecb3 in master.
    //
    // First create a new branch from feature at the last commit you want, in this case 62ecb3.
    //
    // git checkout -b newbranch 62ecb3
    //
    // Next up, you rebase the newbranch commit --onto master. The 76cada^ indicates that you want to start from that specific commit.
    //
    // git rebase --onto master 76cada^
    //
    // The result is that commits 76cada through 62ecb3 are applied to master.

  FILE CONFLICTS

    // EDIT THE INDEX
    //
    // Once git reports the conflict, you are at a prompt and fully able to edit the index in any way you require, to resolve the conflict. So if you're merging feature_x in, you could:
    //
    // 1) Get the branch's script and name it V43
    //
    // git checkout feature_X -- V42__migration.sql
    // mv V42__migration.sql V43__migration.sql
    //
    // 2) Get the V42 script from the previously merged commit
    //
    // git checkout HEAD -- V42__migration.sql
    //
    // 3) Make sure the index is updated properly and finish the merge
    //
    // git add .
    // git commit
    //
    // Another thing to consider, going forward, is that you don't really want git attempting to merge these files. So you could use .gitattributes to either mark the files as binary, or apply a custom merge type to them. I would assume a pattern like whatever/path/to/V*__migration.sql would identify the files.
    //
    // The idea is that if git thinks it has to merge such a path, it should automatically flag a conflict and it should pick one or the other version to keep as the tentative resolution. The person resolving the conflict then just has to put the other version in place.
    //
    // Logically it makes sense to keep "ours" during the merge, because that's the version that will ultimately get that filename. This is what would happen if you mark the path as binary.
    //
    // But pragmatically resolution is simpler if you keep "theirs".
    //
    // mv conflicted_file next_filename
    // git checkout HEAD -- conflicted_file
    //
    // So you might want to look up how to create a custom merge driver in the gitattributes documentation. (It's not as hard as it sounds; the driver can be something like cp %B %A && false. So just a couple of config commands.)
    

'PUSH'

  git push -u origin master ... // Commit from local repository are mirrored in the remote repository when pushing.
  // ... The above output shows that we have successfully pushed all pending commits from the local repository to the remote repository. But what is the -u origin master part of the command? origin means push commits to remote repository URL with short name origin. master means master branch. A repository can have multiple branches. I will explain branches in the next topic.
  // ... -u combined with origin master sets the default remote repository and branch to origin and master respectively for the current branch.


'BRANCH'

	SWITCH TO

	  git branch // [ master, , dev-foo, dev-bar, dev-baz, ... ]
	  git checkout dev-bar

	pull FROM EXISTING BRANCH

		git pull origin dev-foo // $ git fetch origin other-branch && git merge other-branch
		git reset --hard origin/master // Make the local branch reset to the state of the indicated branch
		git fetch --all // Issue: Already up to date. Fetch all remote files from branch origin:dev-foo

		git reset --hard // Allows pulling all files even the ones deleted locally
		git pull origin master

	push TO EXISTING ON REMOTE

	  git add -u // -u Only modified files; -A All updated files, including untracked
	  git reset -- path/to/foo.txt // Exclude specific file from current commit
	  git commit -m "fixed audits when related user is deleted"
		git push origin dev-006 // $ git push origin master:dev-006

	push TO NEW ON REMOTE

	  // git version 2.10.1
	  git checkout -b localBranchNameThatDoesNotExistInRemote // Use --orphan to start a new branch without the history
	  // git checkout --orphan newLocalBranchNotPresentInRemotes // This allows a new branch without a commit history. Do your changes, and do a git commit
		git commit -m "..."
	  git push origin localBranchNameThatDoesNotExistInRemote --force

	push TO NEW LOCAL without COMMITTING

		git checkout -b new-branch-name-here

  MERGE n BRANCHES

    git checkout -b example-merge
    git branch ... // *example-merge
    git merge branch1
    git merge branch2 ... // Assume it cannot auto-merge so manual merging is required
    git mergetool ... // Opens the graphical mergetool
    ... // Inside the mergetool (kdiff3) you select which lines should be kept inside the final output
    ... // When multiple files need manual merging, select what to keep from 1st file, save it, close it, and kdiff3 should auto open the next file in need of merging
    ... // When the manual merging is complete, commit your changes
    git commit -m "..."
    git merge branch2 ... // Merge however many branches you need
    git log -11 ... // The log now contains all the history from branch1, branch2, branch3

  CLONE SPECIFIC BRANCH

    // How to clone a specific branch in git
    // git clone -b <branch> <remote_repo>
    // Example:
    // git clone -b develop git@github.com:user/myproject.git

	LOCAL CREATE FROM REMOTE

	  git checkout branch-name-here -f

  DELETE REMOTE BRANCH

    git push origin --delete tmp

  SUBBRANCH

    // If you want create a new branch from any of the existing branches in Git, just follow the options.
    //
    // First change/checkout into the branch from where you want to create a new branch. For example, if you have the following branches like:
    // ... master, dev, branch1

    // So if you want to create a new branch called "subbranch_of_b1" under the branch named "branch1" follow the steps:
    // Checkout or change into "branch1"
    git checkout branch1

    // Now create your new branch called "subbranch_of_b1" under the "branch1" using the following command.
    git checkout -b subbranch_of_b1 branch1
    // The above will create a new branch called subbranch_of_b1 under the branch branch1 (note that branch1 in the above command isn't mandatory since the HEAD is currently pointing to it, you can precise it if you are on a different branch though).
    // Now after working with the subbranch_of_b1 you can commit and push or merge it locally or remotely.

  REANAME

    $ git branch -m branch1 newbranchname

  DELETE

    $ git branch -d branch-to-delete
    $ git branch -D branch-to-delete ( force deletion without checking the merged status )

	SYNC LIST w REMOTE

	  // Refresh the local list of branches to match remote
	  $ git remote update origin --prune

	RENAME

		$ git branch -m dev-bar dev-baz
		$ git branch -M dev-foo # rename the current branch to dev-foo, discarding current dev-foo

	DELETE

	  git branch -D dev-00x-0x-xxx // best
	  git branch -d dev-00x-0x-xxx

  BRANCH checkout && merge

   MAKE NEW BRANCHES

    git:(master) $ git checkout -b declarative-event-action-binding
    // ... Creates and switches to a new branch called declarative-event-action-binding

    git:(master) $ git branch // ... master // Shows the name of the current branch
    git:(master) $ git branch dev // ... Creates a new branch called dev
    git:(master) $ git branch // ... master // Shows the name of the current branch. It doesn't auto change the active branch to point to the newly created one.

   SWITCH BRANCH

    git:(declarative-event-action-binding) $ git checkout master
    git:(master) $ git checkout declarative-event-action-binding

   MAKE CHANGES AND COMMIT THEM TO THE ACTIVE BRANCH
    // Open index.html, add an <h1/> element to the <body/> element, save the file.

    // Currently in branch called declarative-event-action-binding. Submit the changes into the branch.
    git:(declarative-event-action-binding) $ git status
    git:(declarative-event-action-binding) $ git add -A // Prepare or mark files for commit
    git:(declarative-event-action-binding) $ git commit -m "Added DOM markup" // Commit the changes

    // Open index.js, write console.log(200);, and save the file.

    // Currently in branch called declarative-event-action-binding. Submit the changes into the branch.
    git:(declarative-event-action-binding) $ git status
    git:(declarative-event-action-binding) $ git add -A // Prepare or mark files for commit
    git:(declarative-event-action-binding) $ git commit -m "Added JavaScript implementation" // Commit the changes

    ...
    ...
    ...

   MASTER MERGE WITH BRANCH

    // Currently in branch called add-vue-instance
    git:(add-vue-instance) $ git status
    git:(add-vue-instance) $ git add -A // Prepare or mark files for commit
    git:(add-vue-instance) $ git commit -m "Add vue instance [COMPLETED]" // Commit the changes
    git:(add-vue-instance) $ git checkout master // Switch to the master branch
    git:(master) $ git merge add-vue-instance // Merges the changes from the add-vue-instance branch into the master branch

    
'REMOTE'

	NEW REMOTE OR REPO

    TLDR

      git remote add origin git@git.assembla.com:portfolio/space.space_name.git ... // Adds the new remote
      git remote -v ... // Verifies remote was added: ... origin git@.../....git (fetch) ... origin git@.../....git (fetch)

      git remote set-url origin repo-url ... // Replaces the remote URL instead of replacing the entire remote

		eg by github
			// Get started by creating a new file or uploading an existing file. We recommend every repository include a README, LICENSE, and .gitignore.
			// …or create a new repository on the command line
			echo "# local" >> README.md
			git init
			git add README.md
			git commit -m "my 1st commit"
			git remote add local https://github.com/inesyra/local.git
			git push -u local master

			// or push an existing repository from the command line
			git remote add local https://github.com/inesyra/local.git
			git push -u local master

    eg remote add

			// You have to add an other remote. Usually, you have an origin remotes, which points to the github (maybe bitbucket) repository you cloned it from. Here's a few example of what it is:
			// https://github.com/some-user/some-repo (the .git is optional)
			// git@github.com:some-user/some-repo (this is ssh, it allows you to push/pull without having to type your ids every single time)
			// C:/some/folder/on/your/computer Yes! You can push to an other directory on your own computer.

			// So, when you
			// $ git push origin master
			// origin is replaced with it's value: the url
			// So, it's basically just a shortcut. You could type the url yourself each time, it'd do the same!
			// Note: you can list all your remotes by doing git remote -v.

			// For your problem
			// I'm guessing you want to create a second repository, right? Well, you can create an other remote (or replace the current origin) with the url to this repo!
			// Add an other remote — recommended
			git remote add <remote-name> <url>
			git remote add different-repo https://github.com/your-username/your-repo

			// And then, just
			git push different-repo master

			// Change the origin remote
			git remote set-url <remote-name> <url>
			git remote set-url origin https://github.com/your-username/your-repo

  PUSH TO NEW REMOTE

		// Add new remote called "local"
		git init; git status
		git clone https://github.com/inesyra/local
		git add env; git status
		git commit -m "Linux development environment scripts"
		git branch --set-upstream-to=local/master master
		git push --set-upstream local master
		git pull --allow-unrelated-histories local master
		git push local master

  RESET REMOTE

    // Completely reset remote repository?
    //
    // Delete the .git directory locally.
    // $ rm -R .git
    //
    // Recreate the git repostory:
    // $ cd (project-directory)
    // $ git init
    // $ git add . # If you don't want to commit any files, just not add any files, and add the --allow-empty flag at the end of git commit -m 'Initial commit'. – raf Jul 3 '14 at 12:49
    // $ git commit -m 'Initial commit'
    //
    // Push to remote server, overwriting. Remember you're going to mess everyone else up doing this … you better be the only client.
    // $ git remote add origin <url>
    // $ git push --force --set-upstream origin master
    //
    // Commits are gone, and repository is reset. Can we remove those previous messages also in front of the filenames. – Priyank Bolia Jan 5 '10 at 13:45
    // Remove the remote repository directly on GitHub and recreate it there. – Bombe Jan 5 '10 at 14:14
    // If you don't want to commit any files in your "Initial commit", you can just not add any files, and add the --allow-empty flag at the end of git commit -m 'Initial commit'. – raf Jul 3 '14 at 12:49
    // Using Git 2.3.2, I had to use git push --force --set-upstream origin master But all the rest was working as described – Sébastien Stormacq May 6 '15 at 16:42

  MERGE TWO LOCAL REPOs

    // I have two local git repositories (one is a clone of master repo, other is a clone of fork of master). Is there a way to merge a branch of one with the same branch from other?
    // Note - I can't just add the master as upstream , because we have some issues that way currently - git fetch fails due to pack-object failure .
    // git git-merge
    //
    // You could add another remote repository such as 'local'.
    // Try the following way (which I just ran successfully):
    // (Suppose your local repositories are MyGitRepo.git and AnotherRepo.git in the same folder)
    // in MyGitRepo.git folder:
    // $: git remote add local ../AnotherRepo
    // $: git fetch local
    // $: git merge local/master
    //
    // If master is the branch you want to merge.
    // After git fetch local, you will probably see the following:
    //
    // $ git fetch local
    // From ../AnotherRepo
    // * [new branch]      master     -> local/master
    //
    // which means that another tracking branch is successfully made to track the (other) local repository.

  MERGE DISTINCT REPOs

    // KEEP HISTORY
    //
    // First thing to do is to clone both projects.
    //
    // git clone git@server.com:old-project.git
    // git clone git@server.com:new-project.git
    //
    // What we’re doing is add a remote to the old project, and merge everything into the new one.
    // Since git doesn’t allow merges without a common history, we’ll have to force it using the allow-unrelated-histories option.
    // And since we love well maintained projects, we’re doing everything in a branch we’ll merge after a code review is done.
    //
    // cd new-project
    // git remote add old-project ../old-project
    // git fetch old-project
    // git checkout -b feature/merge-old-project
    // git merge -S --allow-unrelated-histories old-project/master
    // git push origin feature/merge-old-project
    // git remote rm old-project
    //
    // Done. If you run git log, you’ll see the commits of both projects mixed into your log.

    // MOVE FILES
    //
    // Create a new git repository and initialize with a new README file:
    //
    // $ mkdir merged_repo
    // $ cd merged_repo
    // $ git init
    // $ touch README.md
    // $ git add .
    // $ git commit -m "Initialize new repo"
    //
    // Add the first remote repository:
    //
    // $ git remote add -f first_repo `link_to_first_repo`
    // $ git merge --allow-unrelated-histories first_repo/master
    //
    // Create a sub directory and move all first_repo files to it:
    //
    // $ mkdir first_repo
    // $ mv * first_repo/
    // $ git add .
    // $ git commit -m "Move first_repo files to first_repo directory"
    //
    // Add the second remote repository
    //
    // $ git remote add -f second_repo `link_to_second_repo`
    // $ git merge --allow-unrelated-histories second_repo/master
    //
    // Fix any merge conflicts and complete the merge as follows:
    //
    // $ git merge --continue

    // COMBINING TWO GIT REPOSITORIES
    //
    // Use case: You have repository A with remote location rA, and repository B (which may or may not have remote location rB). You want to do one of two things:
    // ... preserve all commits of both repositories, but replace everything from A with the contents of B, and use rA as your remote location
    // ... actually combine the two repositories, as if they are two branches that you want to merge, using rA as the remote location
    // NB: Check out git subtree/git submodule and this Stack Overflow question before going through the steps below. This gist is just a record of how I solved this problem on my own one day.
    // Before starting, make sure your local and remote repositories are up-to-date with all changes you need. The following steps use the general idea of changing the remote origin and renaming the local master branch of one of the repos in order to combine the two master branches.
    //
    // Change the remote origin of B to that of A:
    //
    // $ cd path/to/B
    // $ git remote rm origin
    // $ git remote add origin url_to_rA
    //
    // Rename the local master branch of B:
    //
    // $ git checkout master
    // $ git branch -m master-holder
    //
    // Pull all the code of A from rA into your local B repo.
    //
    // $ git fetch
    // $ git checkout master
    // $ git pull origin master
    //
    // Now the master branch of A is master in B. The old master of B is master-holder.
    // Delete all the things! (i.e, scrap everything from A.) If you actually want to merge both repos, this step is unnecessary.
    //
    // $ git rm -rf *
    // $ git commit -m "Delete all the things."
    //
    // Merge master-holder into master. (If you didn't do the delete step above, you have to option of git checkout master-holder; git rebase master instead.) For more recent versions of git, you'll probably have to add the --allow-unrelated-histories flag (thanks to @sadzik).
    //
    // git merge master-holder --allow-unrelated-histories
    //
    // git log should show all the commits from A, the delete commit, the merge commit, and finally all the commits from B.
    //
    // Push everything to rA
    //
    // git push origin master
    //
    // Now your local copy of B has become a "unified" repository, which includes all the commits from A and B. rA is used as the remote repo. You no longer need your local copy of A or the remote repo rB (although keeping rB around for a bit longer isn't a bad idea).
    //
    // One remark. In my case, it was necessary to add
    //
    // git merge master-holder --allow-unrelated-histories

  SYNC BRANCHES with REMOTE

    git remote update origin --prune  .................................... // Refresh the local list of branches to match remote

  DELETE DIR or FILE FROM REMOTE

    // $ git rm -r --cached <dir>
    // $ git rm -r --cached .vscode
    // $ git rm --cached foo/bar/baz.txt

  \0


'UNDO'

  TLDR

    // 1 - reverts one commits, 2 - reverts last two commits, n - reverts last n commits.
    $ git revert HEAD -m 1

    // This will remove your pushed commits
    $ git reset --hard 'xxxxx' ; git clean -f -d ; git push -f

    // BY HASH - You can revert individual commits
    $ git revert <commit_hash>

    // This will create a new commit which reverts the changes of the commit you specified. Note that it only reverts that specific commit, and not commits after that. If you want to revert a range of commits, you can do it like this:
    $ git revert <oldest_commit_hash>..<latest_commit_hash>

    // LAST -
    $ git reset --soft HEAD=1

  RESET LOCAL TO MATCH REMOTE

    // Setting your branch to exactly match the remote branch:
    // git fetch origin
    // git reset --hard origin/master

    // If you want to save your current branch's state before doing this (just in case), you can do:
    // git commit -a -m "Saving my work, just in case"
    // git branch my-saved-work
    //
    // Now your work is saved on the branch "my-saved-work" in case you decide you want it back (or want to look at it later or diff it against your updated branch).
    // Note that the first example assumes that the remote repo's name is "origin" and that the branch named "master" in the remote repo matches the currently checked-out branch in your local repo.
    // BTW, this situation that you're in looks an awful lot like a common case where a push has been done into the currently checked out branch of a non-bare repository. Did you recently push into your local repo? If not, then no worries -- something else must have caused these files to unexpectedly end up modified. Otherwise, you should be aware that it's not recommended to push into a non-bare repository (and not into the currently checked-out branch, in particular).

  REVERT ONE COMMIT

    // Sometimes you may want to undo a whole commit with all changes. Instead of going through all the changes manually, you can simply tell git to revert a commit, which does not even have to be the last one. Reverting a commit means to create a new commit that undoes all changes that were made in the bad commit. Just like above, the bad commit remains there, but it no longer affects the the current master and any future commits on top of it.
    git revert {commit_id}

    // Used git revert to revert the last commit. When the other module got published, I used git cherry-pick to reapply the reverted commit.

  PUSH OUT LAST COMMIT

    // Deleting the last commit is the easiest case. Let's say we have a remote origin with branch master that currently points to commit dd61ab32.
    // We want to remove the top commit, we want to force the master branch of the origin remote repository to the parent of dd61ab32.
    // Where git interprets x^ as the parent of x and + as a forced non-fastforward push.
    git push origin +dd61ab32^:master

    // If you have the master branch checked out locally, you can also do it in two simpler steps: First reset the branch to the parent of the current commit, then force-push it to the remote.
    git reset HEAD^ --hard
    git push origin -f

  FIX COMMIT AND PUSH

    // Fix the wrong commit and push
    $ git log --graph --oneline --all
    $ git checkout HEAD^ /../../file.php
    $ git commit -am ".. message"
    $ git push origin HEAD --force

    $ git rm -rf --cached ../../file.php
    $ git reset --soft HEAD^1

    $ git rm --cached ../../../file
    $ echo $FILE >> .gitignore
    $ git add .gitignore
    $ git commit --amend --no-edit
    $ git reflog expire --expire=now --all && git gc --prune=now --aggressive

  RESET TO BRANCH
    // Assume dev-foo n commits
    $ git reset origin/master
    $ git add -a
    $ git commit -m "Final commit message instead of n commit messages"

    $ git commit --fixup <commit1> // Automatically marks your commit as a fix of a previous commit
    $ git commit --fixup <commit2> // Automatically marks your commit as a fix of a previous commit
    $ git commit --fixup <commit3> // Automatically marks your commit as a fix of a previous commit
    $ git rebase -i --autosquash // Aautomatically organize merging of these fixup commits and associated normal commits. !!! git rebase -i <after-this-commit> must be launched with as argument the last commit you want to retain as-is, not the first one you want to change.

  RESET SOFT UNTIL

    // Removes all commits after commit 852309 and will bring all changed code after that into the staging area. All commits after this commit are then removed from git history.
    git reset --soft 852309

  RESET TO COMMIT
    // Find the commit hash you want to squash on top of, say d43e15.
    git reset d43e15
    git commit -am 'This commit replaces the latest k commits'

  RESTORE DELETED FILE
    
  	git ls-files --deleted
  	git checkout <path/to/deleted/file.ext> // This will restore the deleted file.
  
  RESET

    'RESET SOFT UNTIL'
      
      git reset --soft HEAD^
      // Actions: uncommit
      // Removes the changes pushed via the last commit and deletes that commit from the log
      // Keeps files in the staging area, i.e. the files added via $ git add ...

      // Removes all commits after commit 852309 and will bring all changed code after that into the staging area. All commits after this commit are then removed from git history.
      git reset --soft 852309

    'RESET MIXED'

      // Remove all commits after commit 852309 and will bring the changed code after that to the working area. This command is the same as git reset 852309.
      git reset --mixed 852309

    'RESET HARD'

      git reset --hard HEAD^
      // Actions: uncommit and unstage
      // Removes the changes pushed via the last commit and deletes that commit from the log
      // It also removes all files added to the staging area via the last $ git add ...

      git reset --hard 852309
      // Remove all commits after commit 852309 and destroy all code changes after it. 
      // This will also remove changed file in working or staging area. 
      // Hence git reset --hard HEAD is also used to get rid of all the changes whether it is inside the working area or the staging area. 
      // One important thing to remember is that all untracked files (newly created files) will not be removed.

    'UNSTAGE FILES'

      // When working with Git, it is quite common for developers to add all the files to your index in order to prepare them for commit.
      //
      // However, in some cases, you may want to remove files from the index, in other words, you want to unstage files.
      //
      // Unstaging files is very beneficial : it can be used to separate files in different commits, or to do work on some other modifications.
      //
      // In this tutorial, we are going to see how you can easily unstage your files on Git.
      //
      // Table of Contents
      //
      //   Unstage files using git reset
      //   Unstage all files on Git
      //   Remove unstaged changes on Git
      //   Unstage commit on Git
      //       Unstage commits softly
      //       Unstage commits hardly
      //   Conclusion
      //
      // Unstage files using git reset
      //
      // The easiest way to unstage files on Git is to use the “git reset” command and specify the file you want to unstage.
      //
      // git reset <commit> -- <path>
      //
      // By default, the commit parameter is optional : if you don’t specify it, it will be referring to HEAD.
      //
      // So what does this command do?
      //
      // This command will reset the index entries (the ones you added to your staging area) to their state at the specified commit (or HEAD if you didn’t specify any commits).
      //
      // Also, we use the double dashes as argument disambiguation meaning that the argument that you are specifying may be related to two distinct objects : branches and directories for example.
      //
      // As a quick example, let’s pretend that you added a file named “README” to your staging area, but now you want to unstage this file.
      //
      // $ git status
      //
      // On branch master
      // Your branch is up to date with 'origin/master'.
      //
      // Changes to be committed:
      // (use "git reset HEAD <file>..." to unstage)
      //
      //       new file:   README
      //
      // In order to unstage the README file, you would execute the following command
      //
      // $ git reset -- README
      //
      // You can now check the status of your working directory again with “git status”
      //
      // $ git status
      //
      // On branch master
      // Your branch is up to date with 'origin/master'.
      //
      // Untracked files:
      // (use "git add <file>..." to include in what will be committed)
      //
      //       README
      //
      // nothing added to commit but untracked files present (use "git add" to track)
      //
      // As you probably understood it by now, the “git reset” command is doing the exact opposite of the “git add” command : it removes files from the index.
      // Unstage all files on Git
      //
      // Previously, we have seen how you can unstage a file by specifying a path or a file to be reset.
      //
      // In some cases, you may want to unstage all your files from your index.
      //
      // To unstage all files, use the “git reset” command without specifying any files or paths.
      //
      // $ git reset
      //
      // Again, let’s pretend that you have created two files and one directory and that you added them to your staging area.
      //
      // $ git status
      //
      // On branch master
      // Your branch is up to date with 'origin/master'.
      //
      // Changes to be committed:
      // (use "git reset HEAD <file>..." to unstage)
      //
      //       new file:   README
      //       new file:   directory/file
      //
      // In order to unstage all files and directories, execute “git reset” and they will be removed from the staging area back to your working directory.
      //
      // $ git reset
      //
      // $ git status
      //
      // On branch master
      // Your branch is up to date with 'origin/master'.
      //
      // Untracked files:
      // (use "git add <file>..." to include in what will be committed)
      //
      //       README
      //       directory/
      //
      // nothing added to commit but untracked files present (use "git add" to track)
      //
      // Remove unstaged changes on Git
      //
      // In some cases, after unstaging files from your staging area, you may want to remove them completely.
      //
      // In order to remove unstaged changes, use the “git checkout” command and specify the paths to be removed.
      //
      // $ git checkout -- <path>
      //
      // Again, let’s say that you have one file that is currently unstaged in your working directory.
      //
      // $ git status
      //
      // On branch master
      // Your branch is up to date with 'origin/master'.
      //
      // Changes not staged for commit:
      // (use "git add <file>..." to update what will be committed)
      // (use "git checkout -- <file>..." to discard changes in working directory)
      //
      //       modified:   README
      //
      // no changes added to commit (use "git add" and/or "git commit -a")
      //
      // In order to discard changes done to this unstaged file, execute the “git checkout” command and specify the filename.
      //
      // $ git checkout -- README
      //
      // $ git status
      //
      // On branch master
      // Your branch is up to date with 'origin/master'.
      //
      // nothing to commit, working tree clean
      //
      // Alternatively, if you want to discard your entire working directory, head back to the root of your project and execute the following command.
      //
      // $ git checkout -- .
      //
      // $ git status
      //
      // On branch master
      // Your branch is up to date with 'origin/master'.
      //
      // nothing to commit, working tree clean
      //
      // Unstage commit on Git
      //
      // In some cases, you actually committed files to your git directory (or repository) but you want to unstage them in order to make some modifications to your commit.
      //
      // Luckily for you, there’s also a command for that.
      // Unstage commits softly
      //
      // To unstage commits on Git, use the “git reset” command with the “–soft” option and specify the commit hash.
      //
      // $ git reset --soft <commit>
      //
      // Alternatively, if you want to unstage your last commit, you can the “HEAD” notation in order to revert it easily.
      //
      // $ git reset --soft HEAD~1
      //
      // Using the “–soft” argument, changes are kept in your working directory and index.
      //
      // As a consequence, your modifications are kept, they are just not in the Git repository anymore.
      //
      // Inspecting your repository after a soft reset would give you the following output, given that you unstaged the last commit.
      //
      // $ git status
      //
      // On branch master
      // Your branch is up to date with 'origin/master'.
      //
      // Changes to be committed:
      // (use "git reset HEAD <file>..." to unstage)
      //
      //       modified:   README
      //
      // What happens if you were to hard reset your commit?
      //
      // In this case, all changes would be discarded and you would lose your changes.
      // Unstage commits hardly
      //
      // To unstage commits on Git and discard all changes, use the “git reset” command with the “–hard” argument.
      //
      // $ git reset --hard <commit>
      //
      //   Note : be careful when using the reset hard command, you will lose all your changes when hard resetting.
      //
      // Conclusion
      //
      // In this tutorial, you learnt how you can unstage files easily on Git using the “git reset” command.
      //
      // You learnt that you can either specify a path or a single file to unstage files and keep on working on your files until you commit them to your repository.
      //
      // If you are curious about Git and software engineering, we have a complete section dedicated to it on the website, make sure to have a look!

  REBASE
  
    // __DO_NOT_USE

  	// Rebase solves the same problem as git merge.
    // Both of these commands are designed to integrate changes from one branch into another branch.
    // 
    // git checkout feature
    // git merge master
    // This also means that the feature branch will have an extraneous merge commit every time you need to incorporate upstream changes.
  	git merge feature master

  	git checkout feature
  	git rebase master
  	// This moves the entire feature branch to begin on the tip of the master branch, incorporating all of the new commits in master.
    // But, instead of using a merge commit, rebasing re-writes the project history by creating brand new commits for each commit in the original branch. This is not cool, bruh!
    
    'REBASE HEAD'
      git rebase -i HEAD~3 // Begin merge of the last 3 commits
      // This will open up your editor with the following:
      // pick f392171 Added new feature X
      // squash ba9dd9a Added new elements to page design
      // squash df71a27 Updated CSS for new elements
      // Save the file

    'REBASE COMMIT'
      git rebase -i 2d23ea524936e612fae1ac63c95b705db44d937d // Keep this one

      // pick / squash what you want:
      // pick 03baz
      // squash 02bar
      // squash 01foo

      // If you have picked only one commit and squashed the rest, you can adjust one commit message. The write :wq to close.

  \0


'101'

	COMMIT FLOW

    git remote update origin --prune  ........... // Refresh the local list of branches to match remote
    git checkout dev-00x  ....................... // -b creates new branches so don't use it if it already exists
    git checkout -b dev-00x  .................... // -b creates new branches so don't use it if it already exists
    ...
    git add -A && git status
    git reset -- path/to/foo.txt ................ // Exclude specific file from current commit
    git commit -m "fix: Lorem ipsum sit" ........ // Save changes in new commit
    git push origin dev-00x  .................... // git push <remote> <branch> Send to remote repo

  WORK ON WRONG BRANCH

    // Assume you have uncommited work on branch master but it needs to be in a 2nd branch.
    git stash push -m "Some comforting message here..." ......... // Stash the changes. These are applied later on the second branch.
    git checkout dev-2nd-branch ................................. // Move to the 2nd branch
    git add -u .................................................. // Stages the files to be touched or possibly replaced by `git stash apply`
    git stash apply ............................................. // Apply the changes stashed earlier

  SETUP

    // Quick setup — if you’ve done this kind of thing before
    //
    // [SSH] git@github.com:inesyra/work-re.git
    //
    // echo "# work-re" >> README.md
    // git init
    // git add README.md
    // git commit -m "first commit"
    // git remote add origin git@github.com:inesyra/work-re.git
    // git push -u origin master
    //
    // or push an existing repository from the command line
    //
    // git remote add origin git@github.com:inesyra/work-re.git
    // git push -u origin master

  MERGETOOL
    // Git: How configure KDiff3 as merge tool and diff tool
    // Ask Question
    // Asked 3 years, 11 months ago
    // Active 4 months ago
    // Viewed 141k times
    // 189
    //
    // Recently I was using GitExtension 2.46, but the Git version that has the same is 1.9.4.msysgit.2. Willing to use only Git commands, I uninstalled GitExtension and install the latest version available of Git and KDiff3.
    //
    // When I make a merge and have conflicts, I run the following command:
    //
    // $ git mergetool
    //
    // Then I receive the message:
    //
    //     The merge tool kdiff3 is not available as 'kdiff3'.
    //
    // I guess it must be by the KDiff3 path.
    //
    // Environment
    //
    //     OS: Windows 10
    //     Git 2.6.1.windows.1
    //     KDiff3 0.9.98 (64 bit)
    //
    // Questions:
    //
    //     What do I have to configure in the .gitconfig file for the command $ git mergetool to open the KDiff3 GUI with the versions LOCAL, REMOTE, BASE and MERGED of conflicted file?
    //
    //     How configure it to use it has diff-tool?
    //
    // git git-merge kdiff3 mergetool
    // shareimprove this question
    // edited Oct 26 '15 at 13:50
    // asked Oct 23 '15 at 17:46
    // Joseph
    // 5,7421212 gold badges2828 silver badges4343 bronze badges
    //
    //     Related post - How to configure a diff tool in Git in general. – RBT Apr 5 '18 at 23:47
    //
    // add a comment
    // 7 Answers
    // active
    // oldest
    // votes
    // 329
    //
    // These sites were very helpful, almost, mergetool and difftool. I used the global configuration, but can be used by repository without problems. You just need to execute the following commands:
    //
    // git config --global --add merge.tool kdiff3
    // git config --global --add mergetool.kdiff3.path "C:/Program Files/KDiff3/kdiff3.exe"
    // git config --global --add mergetool.kdiff3.trustExitCode false
    //
    // git config --global --add diff.guitool kdiff3
    // git config --global --add difftool.kdiff3.path "C:/Program Files/KDiff3/kdiff3.exe"
    // git config --global --add difftool.kdiff3.trustExitCode false
    //
    // The use of the trustExitCode option depends on what you want to do when diff tool returns. From documentation:
    //
    //     git-difftool invokes a diff toually on each file. Errors reported by the diff tool are ignored by default. Use --trust-exit-code to make git-difftool exit when an invoked diff tool returns a non-zero exit code.
    //
    // shareimprove this answer
    // edited Feb 9 '17 at 0:12
    // answered Oct 26 '15 at 14:56
    // Joseph
    // 5,7421212 gold badges2828 silver badges4343 bronze badges
    //
    //     5
    //     Still, why would I want git-difftool not to exit if kdiff3 fails? – David Torres Feb 16 '17 at 16:21
    //     7
    //     For me to have the diff tool recognized by Visual Studio 2015, I had to change this line git config --global --add diff.guitool kdiff3 to this : git config --global --add diff.tool kdiff3 – Guillaume Raymond Apr 11 '17 at 2:42
    //
    //     2
    //     @DavidTorres Probably because badly behaved Windows tools (that exit with non-zero codes on success) ruin it for everyone. – Matthew Flaschen Jun 27 '17 at 17:47
    //     2
    //     According to the referenced docs setting trustExitCode to false is unnecessary, since the default is to ignore it anyway. – matt wilkie Oct 26 '17 at 15:57
    //     4
    //     AFAIK, --add will add a second or third entry when invoked multiple times. That's hard to fix later, because it can't simply be removed with --remove. Just setting a value without --add should be ok. – Thomas Weller Mar 6 '18 at 13:48
    //
    // show 1 more comment
    // 51
    //
    // Just to extend the @Joseph's answer:
    //
    // After applying these commands your global .gitconfig file will have the following lines (to speed up the process you can just copy them in the file):
    //
    // [merge]
    //     tool = kdiff3
    // [mergetool "kdiff3"]
    //     path = C:/Program Files/KDiff3/kdiff3.exe
    //     trustExitCode = false
    // [diff]
    //     guitool = kdiff3
    // [difftool "kdiff3"]
    //     path = C:/Program Files/KDiff3/kdiff3.exe
    //     trustExitCode = false
    //
    // shareimprove this answer
    // edited May 23 '17 at 11:33
    // Community♦
    // 111 silver badge
    // answered Nov 26 '16 at 10:28
    // Igor Kustov
    // 2,50022 gold badges2727 silver badges2828 bronze badges
    //
    //     Why do you suggest not to trust exit code? – Alex78191 May 6 '17 at 7:27
    //     @Alex78191, my answer reflects the Joseph's answer and there you can find more details about this setting. – Igor Kustov May 7 '17 at 17:19
    //     5
    //     It took me a long time to get this right. 2 things led me astray: (1) The .gitconfig file I was editing was not the one being used. See stackoverflow.com/questions/2114111/… for identifying the one(s) being loaded. (2) Don't mix and match cmd = and path = in gitconfig, TL;DR: delete cmd and just use path – matt wilkie Oct 26 '17 at 18:47
    //     1
    //     Now on git bash use .... git difftool <filename> or simple git difftool to run the diff gui kdiff3 you just set. – Vivek Jan 8 '18 at 16:13
    //
    // add a comment
    // 25
    // For Mac users
    //
    // Here is @Joseph's accepted answer, but with the default Mac install path location of kdiff3
    //
    // (Note that you can copy and paste this and run it in one go)
    //
    // git config --global --add merge.tool kdiff3
    // git config --global --add mergetool.kdiff3.path  "/Applications/kdiff3.app/Contents/MacOS/kdiff3"
    // git config --global --add mergetool.kdiff3.trustExitCode false
    //
    // git config --global --add diff.guitool kdiff3
    // git config --global --add difftool.kdiff3.path "/Applications/kdiff3.app/Contents/MacOS/kdiff3"
    // git config --global --add difftool.kdiff3.trustExitCode false
    //
    // shareimprove this answer
    // answered Oct 23 '18 at 4:28
    // kris
    // 5,59333 gold badges4848 silver badges6969 bronze badges
    //
    //     3
    //     Don't use --add since that may result in 2 config entries if you run the command twice. It's a mess cleaning this up, because you can't delete a single entry any more. See git-scm.com/docs/git-config: "Multiple lines can be added to an option" – Thomas Weller Mar 27 at 10:27
    //
    // add a comment
    // 11
    //
    // Well, the problem is that Git can't find KDiff3 in the %PATH%.
    //
    // In a typical Unix installation all executables reside in several well-known locations (/bin/, /usr/bin/, /usr/local/bin/, etc.), and one can invoke a program by simply typing its name in a shell processor (e.g. cmd.exe :) ).
    //
    // In Microsoft Windows, programs are usually installed in dedicated paths so you can't simply type kdiff3 in a cmd session and get KDiff3 running.
    //
    // The hard solution: you should tell Git where to find KDiff3 by specifying the full path to kdiff3.exe. Unfortunately, Git doesn't like spaces in the path specification in its config, so the last time I needed this, I ended up with those ancient "C:\Progra~1...\kdiff3.exe" as if it was late 1990s :)
    //
    // The simple solution: Edit your computer settings and include the directory with kdiff3.exe in %PATH%. Then test if you can invoke it from cmd.exe by its name and then run Git.
    // shareimprove this answer
    // edited Jul 21 '18 at 10:50
    // Peter Mortensen
    // 14.4k1919 gold badges8888 silver badges117117 bronze badges
    // answered Oct 23 '15 at 18:02
    // user3159253
    // 13.1k22 gold badges1717 silver badges3636 bronze badges
    // add a comment
    // 5
    //
    // I needed to add the command line parameters or KDiff3 would only open without files and prompt me for base, local and remote. I used the version supplied with TortoiseHg.
    //
    // Additionally, I needed to resort to the good old DOS 8.3 file names.
    //
    // [merge]
    //     tool = kdiff3
    //
    // [mergetool "kdiff3"]
    //     cmd = /c/Progra~1/TortoiseHg/lib/kdiff3.exe $BASE $LOCAL $REMOTE -o $MERGED
    //
    // However, it works correctly now.
    // shareimprove this answer
    // edited Jul 21 '18 at 10:52
    // Peter Mortensen
    // 14.4k1919 gold badges8888 silver badges117117 bronze badges
    // answered Jun 26 '18 at 7:21
    // martin
    // 2,45811 gold badge1717 silver badges3232 bronze badges
    // add a comment
    // 5
    //
    // To amend kris' answer, starting with Git 2.20 (Q4 2018), the proper command for git mergetool will be
    //
    // git config --global merge.guitool kdiff3
    //
    // That is because "git mergetool" learned to take the "--[no-]gui" option, just like "git difftool" does.
    //
    // See commit c217b93, commit 57ba181, commit 063f2bd (24 Oct 2018) by Denton Liu (Denton-L).
    // (Merged by Junio C Hamano -- gitster -- in commit 87c15d1, 30 Oct 2018)
    //
    //     mergetool: accept -g/--[no-]gui as arguments
    //
    //     In line with how difftool accepts a -g/--[no-]gui option, make mergetool accept the same option in order to use the merge.guitool variable to find the default mergetool instead of merge.tool.
    //
    // shareimprove this answer
    // edited Mar 27 at 22:34
    // answered Nov 4 '18 at 3:43
    // VonC
    // 892k328328 gold badges28942894 silver badges34823482 bronze badges
    // add a comment
    // 3
    //
    // (When trying to find out how to use kdiff3 from WSL git I ended up here and got the final pieces, so I'll post my solution for anyone else also stumbling in here while trying to find that answer)
    // How to use kdiff3 as diff/merge tool for WSL git
    //
    // Steps for using kdiff3 installed on Windows 10 as diff/merge tool for git in WSL:
    //
    //     Add the kdiff3 installation directory to the Windows Path.
    //     Add TMP to the WSLENV Windows environment variable (WSLENV=TMP/up). The TMP dir will be used by git for temporary files, like previous revisions of files, so the path must be on the windows filesystem for this to work.
    //     Set TMPDIR to TMP in .bashrc:
    //
    // # If TMP is passed via WSLENV then use it as TMPDIR
    // [[ ! -z "$WSLENV" && ! -z "$TMP" ]] && export TMPDIR=$TMP
    //
    //     Convert unix-path to windows-path when calling kdiff3. Sample of my .gitconfig:
    //
    // [merge]
    //     renormalize = true
    //     guitool = kdiff3
    // [diff]
    //     tool = kdiff3
    // [difftool]
    //     prompt = false
    // [difftool "kdiff3"]
    //     #path = kdiff3.exe
    //     # Unix style paths must be converted to windows path style by changing '/mnt/c/' or '/c/' to 'c:/'
    //     cmd = kdiff3.exe \"`echo $LOCAL | sed 's_^\\(/mnt\\)\\?/\\([a-z]\\)/_\\2:/_'`\" \"`echo $REMOTE | sed 's_^\\(/mnt\\)\\?/\\([a-z]\\)/_\\2:/_'`\"
    //     trustExitCode = false
    // [mergetool]
    //     keepBackup = false
    //     prompt = false
    // [mergetool "kdiff3"]
    //     path = kdiff3.exe
    //     trustExitCode = false
    //
    // shareimprove this answer

  SSH KEYS

    //   Generating a new SSH key and adding it to the ssh-agent
    //
    //   If you don't already have an SSH key, you must generate a new SSH key. If you're unsure whether you already have an SSH key, check for existing keys.
    //   If you don't want to reenter your passphrase every time you use your SSH key, you can add your key to the SSH agent, which manages your SSH keys and remembers your passphrase.
    //
    //   Generating a new SSH key
    //
    //    Open Terminal.
    //
    //    Paste the text below, substituting in your GitHub email address.
    //    $ ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
    //
    //    This creates a new ssh key, using the provided email as a label.
    //    > Generating public/private rsa key pair.
    //
    //    When you're prompted to "Enter a file in which to save the key," press Enter. This accepts the default file location.
    //    > Enter a file in which to save the key (/home/you/.ssh/id_rsa): [Press enter]
    //
    //    At the prompt, type a secure passphrase. For more information, see "Working with SSH key passphrases".
    //    > Enter passphrase (empty for no passphrase): [Type a passphrase]
    //    > Enter same passphrase again: [Type passphrase again]
    //
    //   Adding your SSH key to the ssh-agent
    //
    //   Before adding a new SSH key to the ssh-agent to manage your keys, you should have checked for existing SSH keys and generated a new SSH key.
    //
    //   Start the ssh-agent in the background.
    //   $ eval "$(ssh-agent -s)"
    //   > Agent pid 59566
    //
    //   Add your SSH private key to the ssh-agent. If you created your key with a different name, or if you are adding an existing key that has a different name, replace id_rsa in the command with the name of your private key file.
    //   $ ssh-add ~/.ssh/id_rsa
    //
    //
    //   Adding a new SSH key to your GitHub account
    //
    //   To configure your GitHub account to use your new (or existing) SSH key, you'll also need to add it to your GitHub account.
    //   After adding a new SSH key to your GitHub account, you can reconfigure any local repositories to use SSH. For more information, see "Switching remote URLs from HTTPS to SSH."
    //   Note: DSA keys (SSH-DSS) are no longer supported. Existing keys will continue to function, but you cannot add new DSA keys to your GitHub account.
    //
    //       Copy the SSH key to your clipboard.
    //
    //       If your SSH key file has a different name than the example code, modify the filename to match your current setup. When copying your key, don't add any newlines or whitespace.
    //
    //       $ sudo apt-get install xclip
    //       # Downloads and installs xclip. If you don't have `apt-get`, you might need to use another installer (like `yum`)
    //
    //       $ xclip -o -sel clip < ~/.ssh/id_rsa.pub
    //       # Copies the contents of the id_rsa.pub file to your clipboard
    //
    //       Tip: If xclip isn't working, you can locate the hidden .ssh folder, open the file in your favorite text editor, and copy it to your clipboard.
    //
    //       In the upper-right corner of any page, click your profile photo, then click Settings.
    //       In the user settings sidebar, click SSH and GPG keys.
    //
    //       Authentication keys
    //
    //       Click New SSH key or Add SSH key.
    //       SSH Key button
    //
    //       In the "Title" field, add a descriptive label for the new key. For example, if you're using a personal Mac, you might call this key "Personal MacBook Air".
    //
    //       Paste your key into the "Key" field.
    //       The key field
    //
    //       Click Add SSH key.
    //       The Add key button
    //
    //       If prompted, confirm your GitHub password.
    
  GITIGNORE
    
    //   .gitignore
    //   /node_modules
    //   /public/hot
    //   /public/storage
    //   /storage/*.key
    //   /vendor
    //   /.idea
    //   /.vagrant
    //   Homestead.json
    //   Homestead.yaml
    //   npm-debug.log
    //   yarn-error.log
    //   .env
    
  DIFFS

    // Diffs are shown by default in Git (and in the previous example) in a format known as
    // a unified format diff. Diffs are used often by Git to indicate changes to files, for example
    // when navigating through history or viewing what you’re about to commit.
    $ git diff --stat master~1 master
    // index.php | 4 +++-
    // ... shows the filename that has been changed, the number of lines changed in that
    // ... file, and +/- characters summarizing the overall changes to the file. If multiple
    // ... files were changed, this would show multiple filenames, and each would have the
    // ... lines changed for that file and +/- characters.
    // 1 file changed, 3 insertion(+), 1 deletions(-)
    // ... lists a summary of totals of the number of files changes and lines inserted/deleted
    // ... across all files.

    $ git diff foo.txt
    // ... Shows the changes made to the file as compared to the last commit (additions, deletions)

  \0


'SETUP'

  'NAME AND EMAIL ADDRESS'

    $ git config --global user.name "George Vranceanu"
    $ git config --global user.email "g_vranceanu@yahoo.com"

  'GENERATE SSH KEYS'

    // $ ssh-keygen -t rsa -b 4096 -C "acme@gmail.com" - GENERATE KEYS
    //
    // ... Generating public/private rsa key pair
    // ... Enter file in which to generate the key: /root/.ssh/id_rsa (overwrite file if it exists)
    // ... Enter passphrase (leave empty for no password): ...
    // ... Your public key has been saved in /root/.ssh/id_rsa.pub
    // ... The key fingerprint is bb:da:0e:...:d5 acme@gmail.com

    // $ eval "$(ssh-agent -s)" - ADD KEY TO SSH AGENT
    // $ ssh-add ~/.ssh/id_rsa
    // ... Identity added: /root/.ssh/id_rsa

    // $ ssh-add -l - VERIFY PRIVATE KEY WAS LOADED INTO SSH

    // $ cat ~/.ssh/id_rsa.pub - ADD KEY TO GIT CLIENT
    //
    // ... ssh-rsa AA2EQD... ... ...Xw== acme@gmail.com
    // Copy the contents of the PUBLIC key - shown above - and put it into the git client: github, gitlab, etc.
    // Each git client can hold multiple keys: the home laptop, the work machine, etc.
    // Github account > Settings > SSH and GPG keys > New SSH key
    // ... Title: keys-git-main
    // ... Key: ssh-rsa AA2EQD... ... ...Xw== acme@gmail.com

    // ssh -T git@github.com ............ // Verify access over ssh

  'REPOSITORIES: LOCAL and REMOTE' init && push

   <> init ' NEW LOCAL REPOSITORY'

    $ cd /Users/Ultimate // Any path on your Linux system
    $ cd C:\Users\Ultimate // Any path on your Windows system

    // For Heroku and Windows Azure deployment, we’ll need a Git repository. To create it from
    // the root of your project, type the following command in your terminal:
    $ git init

    // Git will create a hidden .git folder.

    TELL IT TO MAKE A DIRECTORY FOR THE NEW REPO

      $ git init git_in_practice_redux
      // creates a folder called git_in_practice_redux
      // and a local repo inside, in a sub directory called .git

    USE THE CURRENT FOLDER FOR A NEW REPO

      $ git init
      // Notice no argument needed. It creates the repository in a hidden folder called .git.

   <> push 'NEW REMOTE REPOSITORY'
    // Github > Sign in > Create a new repository ....................................
    // ... Owner: ................ Repository name: ..................................
    // ... Description (optional) ....................................................
    // ... Choose: Public or Private as the type of the repository ...................
    // ... Create repository .........................................................

    // Windows: After commit to local repository, the local repository can be pushed to a remote repository
    $ git remote add origin https://github.com/inesyra/main-repository.git
    $ git push -u origin master
    // ... Push the local repo to remote repo called "origin" on the branch called "master"
    // ... Shows authentication dialog for github username and password

    // Linux: After commit to local repository, the local repository can be pushed to a remote repository
    $ git remote add origin git@github.com:inesyra/main-repository.git
    $ git push -u origin master
    // ... Push the local repo to remote repo called "origin" on the branch called "master"
    // ... Shows authentication dialog for github username and password

    $ git remote -v
    // ... Shows the actions you can take on the remote repo: fetch and push

    <> 'DEPLOY TO REMOTE'

      // The first action you’re concerned with is adding to your previous local repository a
      // reference for your newly created remote repository (also known as a remote) on GitHub
      // or another git provider so you can push and fetch commits.

      // $ cd D:/.../.../.../local_project
      $ git remote add origin https://github.com/GitInPractice/GitInPracticeRedux.git
      $ git remote add origin https://github.com/GithubRepoNameHere/ProjectFolderName.git

      // You can verify that this remote has been created successfully by running git remote --verbose
      $ git remote --verbose

      // You’ve added a remote named origin that points to the remote GitInPracticeRedux
      // repository belonging to the GitInPractice user on GitHub. You can now send and
      // receive changes from this remote. Nothing has been sent or received yet; the new
      // remote is effectively just a named URL pointing to the remote repository location.

      // git remote can also be called with the rename and remove (or rm) subcommands to
      // alter remotes accordingly. git remote show queries and shows verbose information
      // about the given remote. git remote prune deletes any remote references to branches
      // that have been deleted from the remote repository by other users.

      // WHAT IS THE DEFAULT NAME FOR A REMOTE? You can have multiple remote repositories
      // connected to your local repository, so the remote repositories are named.
      // Typically, if you have a single remote repository, it's named origin.

    <> 'TO AZURE REMOTE'

      // In order to deploy our “Hello World” application to Windows Azure, we must add Git
      // remote. You could copy the URL from Windows Azure Portal, under Web Site, and use it
      // with this command:
      $ git remote add azure yourURL

      // To push changes, just execute:
      $ git add .
      $ git commit -m "changing to hello azure"
      // Now we should be able to make a push with this command:
      $ git push azure master

   <> pull 'MERGE CONFLICTS WITH REMOTE'

    // Assume user1 changes in file '~/public/index.php', line 15: Linux: This is the text from file public/index.php, line 15
    $ git push -u origin master

     // Assume user2 changes in file '~/public/index.php', line 15: Windows: This is the text from file public/index.php, line 15. Attempts to push but finds a conflict
     $ git push -u origin master

     //  To see the problem files. This will attempt to "update" the local files to "include" extra information
     // from the remote repository.
     $ git pull origin master
     // ... Notice that the command is called "pull"
     // ... Counting objects
     // ... Automerging public/index.php
     // ... CONFLICT (content): Merge conflict in public/index.php
     // ... Fix conflicts and then commit the result

     // To see the difference between the origin master and local file
     $ git diff public/index.php
     // ... <<<<<<< HEAD (on local repository)
     // ... Windows: This is the text from file public/index.php, line 15 // local
     // ... =======
     // ... Linux: This is the text from file public/index.php, line 15 // remote
     // ... >>>>>>> 0987612345 (on remote repository)

     $ atom public/index.php // Open file in editor
     // Github changed the file contents and added conflicting content to the file. This is what the file contains now:
     // ... Windows: This is the text from file public/index.php, line 15
     // ... ======= (garbage added by Github)
     // ... Linux: This is the text from file public/index.php, line 15

     // Change the file to allow merge with remote:
     // ... Linux: This is the text from file public/index.php, line 15
     // ... Windows: This is the text from file public/index.php, line 15
     // This time the push is successful because the content does not overlap as it did previously.
     $ git push -u origin master

  'CLONE'

   DESC
    // CLoning a repo actually clones or copies the contents of one repo to your local
    // computer. This allows quick starting with existing projects and all of their files.

    $ cd var/www/web
    $ git clone git@github.com:StephenGrider/AdvancedNodeStarter.git
    // Itc it creates a new "AdvancedNodeStarter" folder inside "web".
    // That new folder contains all the files in the specified repo.

    $ git clone -b <branch> <remote_repo>

    // With Git 1.7.10 and later, add --single-branch to prevent fetching of all branches. Example, with OpenCV 2.4 branch:
    $ git clone -b opencv-2.4 --single-branch https://github.com/Itseez/opencv.git


\0
```
