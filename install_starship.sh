#!/bin/bash

EVAL_STARSHIP='eval "$(starship init bash)"'

grep "$EVAL_STARSHIP" ~/.bashrc

if [ $? == 0 ]; then
  echo "starship installed successfully"
else
  echo "add eval starship command to ~/.bashrc"
  echo "$EVAL_STARSHIP" >> ~/.bashrc
fi
