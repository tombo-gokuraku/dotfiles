#!/bin/bash
# install apt applications
# ppaを追加する
## Add copyq ppa
if [ -f "/etc/apt/sources.list.d/hluk-ubuntu-copyq-focal.list" ]; then
  echo "ppa is already existed"
else
  sudo add-apt-repository -y ppa:hluk/copyq
fi

## Add lazygit ppa
if [ -f "/etc/apt/sources.list.d/lazygit-team-ubuntu-release-focal.list" ]; then
  echo "ppa is already existed"
else
  sudo add-apt-repository -y ppa:lazygit-team/release
fi

## Add obs ppa
if [ -f "/etc/apt/sources.list.d/obsproject-ubuntu-obs-studio-focal.list" ]; then
  echo "ppa is already existed"
else
  sudo add-apt-repository -y ppa:obsproject/obs-studio
fi

# update & upgrade
sudo apt update && sudo apt upgrade -y
cat ./apt_install_list.txt  | xargs sudo apt install -y
