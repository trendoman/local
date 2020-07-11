#! /bin/bash
set -e

# https://phoenixnap.com/kb/how-to-install-vagrant-on-ubuntu

APP="vagrant"
VERSION="2.2.7"
FILE="vagrant_${VERSION}_x86_64.deb"
URL="https://releases.hashicorp.com/vagrant/${VERSION}/vagrant_${VERSION}_x86_64.deb"

echo "Preparing ${APP} installation ..."
sudo apt-get -y update
sudo apt-get -y upgrade

# To make sure you’re running the latest version of Vagrant, open a web browser to https://www.vagrantup.com/downloads.html.
# Since Ubuntu is a Debian-based operating system, choose either the 32-bit or 64-bit link under the Debian heading.
echo "Downloading version ${VERSION} ..."
sudo wget $URL

sudo dpkg -i $FILE
rm -f $FILE
echo "Successfully installed $($APP --version) ..."

vagrant plugin install vagrant-multi-hostsupdater
vagrant plugin install vagrant-vbguest

echo -e "Adding useful alias entries for ${APP} ..."
echo -e "\n# vagrant" >> ~/.bashrc
echo -e "alias v='vagrant'" >> ~/.bashrc
echo -e "alias v_ssh_acme='cd /\$PACME && v ssh'" >> ~/.bashrc

echo "Done"

# ? Vagrant unable to mount shared folders. Filesystem "vboxsf" is not available.
# vagrant vbguest

# ? Run these in case of trouble with the installation of plugins:
# vagrant plugin repair
# vagrant plugin update
# vagrant plugin list # Output: vbguest, multi-hostsupdater
