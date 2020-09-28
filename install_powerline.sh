#!/bin/bash
# Run install_apt.sh and install_pip.sh before run this script.

# get powerline install path
########################################################
# Disable powerline bash prompt.
# Because it is too heavy to use.
# Use starship instead.
########################################################
# PYTHON_SITE_PACKAGES_PATH=$(python3 -m site --user-site | sed "s/\/home\/$(whoami)/\~/")
# POWERLINE_BASH_PATH="$PYTHON_SITE_PACKAGES_PATH/powerline/bindings/bash/powerline.sh"
#
# grep $POWERLINE_BASH_PATH ~/.bashrc
#
# if [ $? == 0 ]; then
#   echo "powerline bash script sourced successfully."
# else
#   echo "source $POWERLINE_BASH_PATH"
#   echo "[ -f $POWERLINE_BASH_PATH ] && source $POWERLINE_BASH_PATH" >> ~/.bashrc
# fi
