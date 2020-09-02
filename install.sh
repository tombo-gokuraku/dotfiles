#!/bin/bash

# Install apt packages
bash ./install_apt.sh

# install pip applications
bash ./install_pip.sh

# install snap applications
bash ./install_snap.sh

# install cargo applications
bash ./install_cargo.sh

# install nvm & Node.js & npm
bash ./install_npm.sh

# create nvim_env
bash ./create_nvim_env.sh

# install font
bash ./install_font.sh

# link dotfiles
bash ./link.sh
