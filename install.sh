#!/bin/bash
sudo apt update && sudo apt upgrade -y
cat ./apt_install_list.txt  | xargs sudo apt install -y
cat ./pip_install_list.txt  | xargs pip3 install --user
cat ./npm_install_list.txt  | xargs sudo npm -g install

