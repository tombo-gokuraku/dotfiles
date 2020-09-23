#!/bin/bash

# check alacritty installation
if [[  $(command -v alacritty)  ]]; then
  echo "$(alacritty --version) is already installed"
  exit
else
  echo "alacritty is not installed"
fi

pushd .

# make applications directory
mkdir -p ~/Apps
cd ~/Apps

# clone repository
git clone https://github.com/alacritty/alacritty.git
cd alacritty

# check rustup & cargo installation
if [[  $(command -v rustup)  ]] && [[ $(command -v cargo) ]]; then
  echo "rustup & cargo are already installed"
else
  echo "rustup & cargo aren't installed"
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y #disable prompt
fi

# update rustup
rustup override set stable
rustup update stable

# install build dependencies
sudo apt install cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev python3 -y

# build alacritty
cargo build --release

# terminfo check
infocmp alacritty

if [ $? == 0 ]; then
  echo "terminfo installed successfully"
else
  echo "faile to install terminfo"
  sudo tic -xe alacritty,alacritty-direct extra/alacritty.info
fi

# create desktop entry
sudo cp target/release/alacritty /usr/local/bin # or anywhere else in $PATH
sudo cp extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg
sudo desktop-file-install extra/linux/Alacritty.desktop
sudo update-desktop-database

# add man
sudo mkdir -p /usr/local/share/man/man1
gzip -c extra/alacritty.man | sudo tee /usr/local/share/man/man1/alacritty.1.gz > /dev/null

# add alacritty automatic completions
echo "source ~/Apps/alacritty/extra/completions/alacritty.bash" >> ~/.bashrc

# set alacritty to default terminal
sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator /usr/local/bin/alacritty 50

popd
