#!/bin/bash

# check rustup & cargo installation
if [[  $(command -v rustup)  ]] && [[ $(command -v cargo) ]]; then
  echo "rustup & cargo are already installed"
else
  echo "rustup & cargo aren't installed"
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y #disable prompt
fi

# update rustup
rustup update stable

# install build dependencies
sudo apt install libssl-dev
# install cargo applications
cat ./cargo_install_list.txt  | xargs $HOME/.cargo/bin/cargo install -j4 #初回インストール時はログアウトするまで`cargo`のパスが通らないので、直接指定する

# install alacritty
bash ./install_alacritty.sh

# install starship
bash ./install_starship.sh
