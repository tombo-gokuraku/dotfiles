#!/bin/bash

# Install apt packages
bash ./install_apt.sh

# install pip applications
bash ./install_pip.sh

# install snap applications
bash ./install_snap.sh

# install cargo applications
bash ./install_cargo.sh

# install nvm & Node.js & npm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
nvm install --lts #install LTS version Node.js
# install npm applications
nvm use --lts
cat ./npm_install_list.txt  | xargs npm -g install

# create nvim_env
python3 -m venv ~/Env/python_env/nvim_env
source ~/Env/python_env/nvim_env/bin/activate
pip3 install -r nvim_env_requirements.txt
deactivate
