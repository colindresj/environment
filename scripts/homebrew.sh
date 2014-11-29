#!/bin/bash

function setup_brew () {
  echo "$(tput setaf 9)Installing Homebrew..."
  ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go/install)"

  brew update
  brew doctor
}

function install_formulae () {
  echo "Tapping homebrew/dupes..."
  brew tap homebrew/dupes

  echo "Tapping phinze/cask"
  brew tap phinze/cask

  echo "Tapping caskroom/versions"
  brew tap caskroom/versions

  echo "Tapping thoughtbot/formulae"
  brew tap thoughtbot/formulae

  echo "Installing useful formulae..."

  # TODO use Brewfile
  declare -a formulae=(
    apple-gcc42
    autoconf
    automake
    brew-cask
    cmatrix
    curl
    git
    graphviz
    heroku-toolbelt
    hub
    imagemagick
    irssi
    libyaml
    mongodb
    mysql
    ngrok
    node
    openssl
    pianobar
    pkg-config
    postgresql
    qt
    rbenv
    rbenv-gem-rehash
    rcm
    readline
    redis
    ruby-build
    sqlite
    terminal-notifier
    the_silver_searcher
    wget
  )

  for formula in "${formulae[@]}"
  do
    :
    echo "Installing $formula formula..."
    brew install $formula
  done
}

function install_casks () {
  echo "Installing useful apps through brew cask..."

  # TODO use Brewfile
  declare -a casks=(
    alfred
    clipmenu
    cloud
    dash
    dropbox
    firefox
    flux
    fontprep
    google-chrome
    heroku-toolbelt
    layervault
    macvim
    mou
    opera
    postgres
    qlcolorcode
    qlmarkdown
    qlstephen
    quicklook-json
    recordit
    sketch
    skype
    slack
    sonos
    spectacle
    spotify
    sublime-text
    the-unarchiver
    vagrant
    virtualbox
    vlc
  )

  for cask in "${casks[@]}"
  do
    :
    echo "Installing $cask..."
    brew cask install $cask
  done
}

hide_alias_arrow () {
  mv /System/Library/CoreServices/CoreTypes.bundle/Contents/Resources/AliasBadgeIcon.icns /System/Library/CoreServices/CoreTypes.bundle/Contents/Resources/AliasBadgeIcon-bak.icns
  echo "Removed symlink arrow from applications"
}

setup_brew
install_formulae
install_casks
hide_alias_arrow
