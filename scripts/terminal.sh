#!/bin/bash

get_ir_black_for_terminal () {
  local ir_black_theme_location=https://gist.githubusercontent.com/colindresj/eaac45207743a0894db6/raw/504ce4ecfa3014be67d8aab158c3f0438576fbdb/IR%20Black.terminal

  echo "Downloading IR Black for Terminal.app..."
  curl -o IR\ Black.terminal $ir_black_theme_location
}

setup_terminal () {
  get_ir_black_for_terminal

  echo "Setting IR Black as Terminal.app default..."
  open IR\ Black.terminal
  sleep 3
  defaults write com.apple.terminal "Default Window Settings" -string "IR Black"
  defaults write com.apple.terminal "Startup Window Settings" -string "IR Black"
  rm -f IR\ Black.terminal
}

get_iterm_theme () {
  curl -#o "$1".itermcolors $2
  open "$1".itermcolors
  rm -f "$1".itermcolors
}

get_all_iterm_themes () {
  get_iterm_theme "Tomorrow Night" "https://gist.githubusercontent.com/colindresj/78de2dee8c9561d8ad85/raw/"
  get_iterm_theme "Tomorrow Night Eighties" "https://gist.githubusercontent.com/colindresj/9a6377ae0d271b6f440b/raw/"
  get_iterm_theme "Spring" "https://gist.githubusercontent.com/colindresj/d70d16eb9208b3fa3661/raw/"
  get_iterm_theme "SpaceGray" "https://gist.githubusercontent.com/colindresj/50c7eab68bbfae58b76e/raw"
  get_iterm_theme "IR Black" "https://gist.githubusercontent.com/colindresj/013f6ee2e41be60cb889/raw/"
}

setup_iterm () {
  echo "Installing themes for iTerm..."
  get_all_iterm_themes
}

# Terminal.app
setup_terminal

# iTerm 2
setup_iterm
