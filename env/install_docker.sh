#! /bin/bash

# https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-18-04

APP="docker-ce"

echo "Preparing $APP installation ..."
sudo apt update # Update your existing list of packages:
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common # Lets apt use packages over HTTPS

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - # Add the GPG key for the official Docker repository to your systemsudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable" # Add the Docker repository to APT sources
sudo apt -y update # Update the package database with the Docker packages from the new repo

apt-cache policy $APP # Make sure you are about to install from the Docker repo
echo "Installing $APP ..."
sudo apt install -y $APP
echo "Successfully installed $($APP version). Restarting service ..."
sudo systemctl status docker

echo "Adding $USER to the docker group ..."
sudo usermod -aG docker $USER
su - $USER
echo "Verifying $USER was added to the docker group ..."
id -nG

APP="docker-compose"
echo "Installing $APP ..."
sudo curl -L "https://github.com/docker/compose/releases/download/1.25.0-rc2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
echo "Successfully installed $(docker-compose --version)";

