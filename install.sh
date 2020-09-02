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
python3 -m venv ~/Env/python_env/nvim_env
source ~/Env/python_env/nvim_env/bin/activate
pip3 install -r nvim_env_requirements.txt
deactivate
