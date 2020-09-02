#!/bin/bash
# install nerd font for vim-devicons
FONT_DIRECTORY="$HOME/.local/share/fonts"
FONT_NAME="Droid Sans Mono for Powerline Nerd Font Complete.otf"
FONT_URL="https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20Nerd%20Font%20Complete.otf"

# create fonts directory
if [ ! -d $FONT_DIRECTORY ] ; then
  echo "Make fonts directory at $FONT_DIRECTORY"
  mkdir -p $FONT_DIRECTORY
fi

# download fonts and update cache
if [ ! -f "$FONT_DIRECTORY/$FONT_NAME" ] ; then
  cd $FONT_DIRECTORY && echo $(pwd) && curl -fLo "$FONT_NAME" $FONT_URL && cd - && fc-cache
else
  echo "$FONT_NAME is already installed"
fi
