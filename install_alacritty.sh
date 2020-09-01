#!/bin/bash
pushd .

# make applications directory
mkdir -p ~/Apps
cd ~/Apps

# clone repository
git clone https://github.com/alacritty/alacritty.git
cd alacritty

# update rustup
rustup override set stable
rustup update stable

# install build dependencies
sudo apt install cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev python3

# build alacritty
cargo build --release

# terminfo check
infocmp alacritty

if [ $? = 0 ]; then
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
