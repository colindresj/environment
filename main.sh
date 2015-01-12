#!/bin/bash

#######################################################################################
#### CONSTANTS
#######################################################################################
SETTINGS=./settings
SCRIPTS=./scripts
DOTFILES=./dotfiles
RUBY_DEFAULT="2.1.4"

#######################################################################################
#### UTILITY FUNCTIONS
#######################################################################################
function start_confirm () {
  read -p "$(tput setaf 3)Press Return to perform task: $@ >"
  tput sgr0
  clear
}

function end_confirm () {
  read -p "$(tput setaf 4)Task complete. Press Return to move on >"
  tput sgr0
  clear
}

function get_user_info () {
   echo "Please enter your github email:"
   read EMAIL
   echo "Your github email is: $EMAIL"
}

#######################################################################################
#### SETUP
#######################################################################################
# get_user_info
# source $SCRIPTS/setup.sh
# end_confirm

#######################################################################################
#### COMMAND LINE TOOLS
#######################################################################################
# start_confirm "Check for command line tools"
# source $SCRIPTS/commandlinetools.sh
# end_confirm

#######################################################################################
#### HOMEBREW
#######################################################################################
# start_confirm "Install Homebrew"
# source $SCRIPTS/homebrew.sh
# end_confirm

#######################################################################################
#### RUBY
#######################################################################################
# start_confirm "Install Ruby"
# source $SCRIPTS/ruby.sh
# end_confirm

#######################################################################################
#### NODE
#######################################################################################
# start_confirm "Install Node"
# source $SCRIPTS/node.sh
# end_confirm

#######################################################################################
#### OSX AND APPLICATION SETTINGS
#######################################################################################
# start_confirm "Set preferences"
# source $SCRIPTS/osx_settings.sh
# source $SCRIPTS/terminal.sh
# source $SCRIPTS/sublime.sh
# source $SCRIPTS/vim.sh
# end_confirm
