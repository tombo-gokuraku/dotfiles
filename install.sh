#!/bin/bash

# install apt applications
# ppaを追加する
sudo add-apt-repository -y ppa:hluk/copyq
sudo add-apt-repository -y ppa:lazygit-team/release
sudo add-apt-repository -y ppa:obsproject/obs-studio
# update & upgrade
sudo apt update && sudo apt upgrade -y
cat ./apt_install_list.txt  | xargs sudo apt install -y

# install pip applications
pip3 install --user -r pip_install_list.txt

# install snap applications
cat ./snap_install_list.txt  | xargs sudo snap install

# install rustup & cargo
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y #disable prompt
# install cargo applications
cat ./cargo_install_list.txt  | xargs $HOME/.cargo/bin/cargo install -j4 #初回インストール時はログアウトするまで`cargo`のパスが通らないので、直接指定する

# install nvm & Node.js & npm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
nvm install --lts #install LTS version Node.js
# install npm applications
cat ./npm_install_list.txt  | xargs npm -g install

# create nvim_env
python3 -m venv ~/Env/python_env/nvim_env
source ~/Env/python_env/nvim_env/bin/activate
pip3 install -r nvim_env_requirements.txt
deactivate
