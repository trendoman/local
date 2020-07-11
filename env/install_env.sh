#! /bin/bash

# Calls the script as another process. Variables and functions in the other script will not be accessible.
/bin/bash ./git_install.sh

/bin/bash ./virtualbox_install.sh
/bin/bash ./virtualbox_install_cleanup.sh
/bin/bash ./vagrant_install.sh
/bin/bash ./docker_install.sh

