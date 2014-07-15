#!/bin/bash

copy () {
  files=(bash_profile gitconfig gitignore_global pryrc)
  destination=$HOME/dotfiles
  backups=$HOME/dotfiles_old

  echo "$(tput setaf 9)Creating $destination to store and track new dotfiles"
  mkdir -p $destination

  echo "Creating $backups to backup any existing dotfiles"
  mkdir -p $backups

  echo "Moving existing dotfiles from $HOME to $backups..."
  for file in "${files[@]}"; do
    mv "$HOME/.$file" $backups
    rm -f "$HOME/.$file"

    echo "Copying new $file"
    cp $DOTFILES/$file "$destination/$file"
    echo "Symlinking new $file"
    ln -s $destination/$file $HOME/.$file
  done
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
  echo "Setting IR Black as terminal default..."
  open "$SETTINGS/terminal/IR-Black.terminal"
  sleep 3
  defaults write com.apple.terminal "Default Window Settings" -string "IR Black"
  defaults write com.apple.terminal "Startup Window Settings" -string "IR Black"
}

setup_vundle () {
  if [ ! -e $HOME/.vim/bundle/vundle ]; then
    mkdir -p $HOME/.vim/bundle/
    git clone https://github.com/gmarik/vundle.git $HOME/.vim/bundle/vundle
  fi
}

# Own all directories from home and down
sudo chown -R ${USER} ~

# Copy and symlink dotfiles
copy

# Reloading the session
source ~/.bash_profile

setup_ssh
setup_terminal
setup_vundle
