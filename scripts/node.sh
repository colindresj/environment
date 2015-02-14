#!/bin/bash

function install_nvm ()  {
  curl https://raw.githubusercontent.com/creationix/nvm/v0.22.1/install.sh | bash
}

function install_and_set_stable_node() {
  nvm install stable
  nvm alias default stable
}

function install_modules () {
  echo "$(tput setaf 3)Installing useful Node modules through NPM..."
  tput sgr0

  # TODO use parse function instead of this super long hard-coded array
  declare -a modules=(
    bower
    broccoli-cli
    browser-sync
    browserify
    coffee-script
    david
    express-generator
    generator-gulp-webapp
    generator-webapp
    grunt-cli
    gulp
    http-server
    istanbul
    karma-cli
    less
    mocha
    node-inspector
    nodemon
    prettyjson
    requirejs
    stylus
    uglify-js
    vtop
    webpack
    webpack-dev-server
    yo
  )

 for i in "${modules[@]}"
  do
    :
    echo "Installing $i..."
    npm install -g $i
  done
}

# Install NVM for switching versions
install_nvm

# Reload bash
source ~/.bash_profile

# Install latest stable node
install_and_set_stable_node

# Reload bash
source ~/.bash_profile

# Install modules from NPM
install_modules
