#! /bin/bash

APP="node"
curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
sudo apt install -y nodejs

echo "Node version: $(node --version)"

