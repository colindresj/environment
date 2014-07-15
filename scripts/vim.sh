#!/bin/bash

clone_vundle () {
  if [ ! -e $HOME/.vim/bundle/vundle ]; then
    mkdir -p $HOME/.vim/bundle
    git clone https://github.com/gmarik/vundle.git $HOME/.vim/bundle/vundle
  fi
}

bundle_plugins () {
  vim -u $HOME/.vimrc +BundleInstall +qa
  vim -u $HOME/.vimrc +BundleClean! +qa
}

clone_vundle
bundle_plugins
