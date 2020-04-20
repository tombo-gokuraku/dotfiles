#!/bin/bash
sudo apt update && sudo apt upgrade -y
cat ./apt_install_list.txt  | xargs sudo apt install -y
pip3 install --user -r pip_install_list.txt
cat ./snap_install_list.txt  | xargs sudo snap install

# install rustup & cargo
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
cat ./cargo_install_list.txt  | xargs cargo install -j4

# install nodejs
cat ./npm_install_list.txt  | xargs sudo npm -g install

# create nvim_env
python3 -m venv ~/Env/python_env/nvim_env
source ~/Env/python_env/nvim_env/bin/activate
pip3 install -r nvim_env_requirements.txt
deactivate
