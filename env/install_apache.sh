#! /bin/bash

# https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-18-04

APP="apache2"

echo "Preparing ${APP} installation ..."
# Update your existing list of packages:
sudo apt update

echo "Installing ${APP} ..."
sudo apt install apache2
echo "Successfully installed ${APP} ..."

# Adjusting the Firewall. Output: Available applications: Apache, Apache Full, Apache Secure, OpenSSH
sudo ufw app list
# It is recommended that you enable the most restrictive profile that will still allow the traffic you’ve configured. Since we haven’t configured SSL for our server yet in this guide, we will only need to allow traffic on port 80:
sudo ufw allow 'Apache'
sudo ufw status

echo "Restarting service ..."
sudo systemctl status apache2

echo "Make [GET] request to the following addresses to verify ..."
hostname -I
curl -4 icanhazip.com

# When you have your server’s IP address, enter it into your browser’s address bar:
curl -4 localhost

sudo systemctl enable $APP
sudo systemctl stop $APP
sudo systemctl start $APP

