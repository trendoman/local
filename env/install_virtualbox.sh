#! /bin/bash

# https://vitux.com/how-to-install-virtualbox-on-ubuntu/

APP="virtualbox"
VERSION="6.0"
FLAVOR=$(lsb_release -c | awk '{print $2}')

echo "Preparing ${APP} installation ..."
sudo apt-get -y update
sudo apt-get upgrade

echo "Importing the Oracle public keys to your system"
wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -

echo "Adding a new repository to APT sources ..."
sudo add-apt-repository "deb http://download.virtualbox.org/virtualbox/debian ${FLAVOR} contrib"
sudo apt-get -y update

echo "Installing ${APP} ..."
sudo apt-get install -y "${APP}-${VERSION}"
echo "Successfully installed ${APP} ..."

echo "Installing the extension package ..."
yes | sudo apt install virtualbox-ext-pack

yes | sudo apt-get install virtualbox-dkms
yes | sudo apt-get install linux-headers-generic

sudo dpkg-reconfigure virtualbox-dkms
sudo dpkg-reconfigure virtualbox
sudo modprobe vboxdrv

# [Does not work w Linux 19.10]
# VirtualBox + Secure Boot + Ubuntu = fail
# The problem is the requirement that all kernel modules must be signed by a key trusted by the UEFI system.
# Ubuntu does not sign the third party vbox* kernel modules. It gives the user the option to disable Secure Boot upon installation of the virtualbox package.
sudo su -
mkdir /root/module-signing
cd /root/module-signing
# Create a personal public/private RSA key pair which will be used to sign kernel modules
openssl req -new -x509 -newkey rsa:2048 -keyout MOK.priv -outform DER -out MOK.der -nodes -days 36500 -subj "/CN=geovra/"
chmod 600 MOK.priv

# Use the MOK (“Machine Owner Key”) utility to import the public key so that it can be trusted by the system. This is a two step process where 
# the key is first imported, and then later must be enrolled when the machine is booted the next time. A simple password is good enough, as it 
# is only for temporary use.
mokutil --import /root/module-signing/MOK.der
#  input password: <any_password>
# input password again: <any_password>

sudo apt autoremove

# Reboot the machine
# When the bootloader starts, the MOK manager EFI utility should automatically start. It will ask for parts of the password supplied. Choose to 
# “Enroll MOK”, then you should see the key imported in step 3. Complete the enrollment steps, then continue with the boot. The Linux kernel will 
# log the keys that are loaded, and you should be able to see your own key with the command: dmesg|grep 'EFI: Loaded cert'
shutdown -r now

 
