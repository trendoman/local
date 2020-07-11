#! /bin/bash

# https://phoenixnap.com/kb/how-to-install-vagrant-on-ubuntu

APP="openvpn"
VERSION="2.4.4"

echo "Preparing ${APP} installation ..."
sudo apt-get -y update
sudo apt-get -y upgrade

sudo apt install $APP
echo "Successfully installed $($APP --version) ..."

# Start connection with manual login profile
# sudo openvpn --config /etc/openvpn/acme.ovpn
