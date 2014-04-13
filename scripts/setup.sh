#!/bin/bash

copy () {
  echo "Copying $@..."
  cp "$DOTFILES/$@" "${HOME}/.$@"
}

set_git () {
  if [[ `git config --global user.email` != "$EMAIL" ]]; then
    git config --global user.email $EMAIL
  fi
}

setup_ssh () {
  if [[ ! -d ~/.ssh ]; then
    mkdir ~/.ssh
  fi

  if [[ ! -f ~/.ssh/id_rsa.pub ]]; then
    echo "Generating an SSH key"
    ssh-keygen -t rsa -C "$EMAIL"
    ssh-add id_rsa
  fi

  pbcopy < ~/.ssh/id_rsa.pub
  echo "Public ssh key copied to your clipboard. Go to your Github account and add this key."
  sleep 3
  open https://github.com/settings/ssh
  read -p "$(tput setaf 4)Press Return when complete >"
  tput sgr0
  ssh -T git@github.com
}

setup_terminal () {
  echo "Seting IR Black as terminal default..."
  open "$SETTINGS/terminal/IR-Black.terminal"
  sleep 3
  defaults write com.apple.terminal "Default Window Settings" -string "IR Black"
  defaults write com.apple.terminal "Startup Window Settings" -string "IR Black"
}

# Own all directories from home and down
sudo chown -R ${USER} ~

# Copy dotfiles
copy bash_profile
copy gitconfig
copy gitignore_global
copy pryrc

# Reloading the session
source ~/.bash_profile

setup_ssh
setup_terminal
