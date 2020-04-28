#! /bin/bash

# https://tecadmin.net/install-go-on-ubuntu/

APP="go"

# Update your existing list of packages:
sudo apt-get -y update
sudo apt-get -y upgrade

echo "Installing ${APP} ..."
wget https://dl.google.com/go/go1.13.linux-amd64.tar.gz
sudo tar -xvf go1.13.linux-amd64.tar.gz
sudo mv go /usr/local

# GOROOT is the location where Go package is installed on your system
export GOROOT=/usr/local/go

# GOPATH is the location of your work directory
mkdir -p ~/Dev/go
export GOPATH=$HOME/Dev/go

# Now set the PATH variable to access go binary system wide
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin
echo "export PATH=$GOPATH/bin:$GOROOT/bin:$PATH" >> ~/.profile
source ~/.profile

go env
sudo rm go1.13.linux-amd64.tar.gz
echo "Successfully installed ${APP} ..."
go version

