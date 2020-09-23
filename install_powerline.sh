#!/bin/bash
# Run install_apt.sh and install_pip.sh before run this script.

POWERLINE_BASH_PATH="~/.local/lib/python3.8/site-packages/powerline/bindings/bash/powerline.sh"

grep $POWERLINE_BASH_PATH ~/.bashrc

if [ $? == 0 ]; then
  echo "powerline bash script sourced successfully."
else
  echo "source $POWERLINE_BASH_PATH"
  echo "[ -f $POWERLINE_BASH_PATH ] && source $POWERLINE_BASH_PATH" >> ~/.bashrc
fi
