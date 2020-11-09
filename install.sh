#!/bin/bash

# Install apt packages
bash ./install_apt.sh

# install pip applications
bash ./install_pip.sh

# install snap applications
bash ./install_snap.sh

# install cargo applications
bash ./install_cargo.sh

# install nvm & Node.js & npm & yarn
bash ./install_node.sh
bash ./install_yarn.sh

# create nvim_env
bash ./create_nvim_env.sh

# install font
bash ./install_font.sh

# install powerline
bash ./install_powerline.sh

# link dotfiles
bash ./link.sh
