#!/bin/bash
FONT_DIRECTORY="$HOME/.local/share/fonts"

FONT_NAME="Droid Sans Mono for Powerline Nerd Font Complete.otf"
FONT_URL="https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20Nerd%20Font%20Complete.otf"

if [ ! -d $FONT_DIRECTORY ] ; then
  echo "Make fonts directory at $FONT_DIRECTORY"
  mkdir -p $FONT_DIRECTORY
fi

if [ ! -f "$FONT_DIRECTORY/$FONT_NAME" ] ; then
  cd $FONT_DIRECTORY && echo $(pwd) && curl -fLo "$FONT_NAME" $FONT_URL && cd - && fc-cache
fi
