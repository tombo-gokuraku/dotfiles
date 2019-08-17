#!/bin/bash
sudo apt update && sudo apt upgrade -y
cat ./apt_install_list.txt  | xargs sudo apt install -y
