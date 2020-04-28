#! /bin/bash

# https://www.digitalocean.com/community/tutorials/how-to-install-mysql-on-ubuntu-18-04
APP="mysql"

# Update your existing list of packages:
sudo apt-get -y update
sudo apt-get -y upgrade

echo "Installing ${APP} ..."
sudo apt-get -y install mysql-server
sudo mysql_secure_installation

# export MYSQL_NULL=/usr/local/go
echo "Successfully installed ${APP} ..."
mysql -v
