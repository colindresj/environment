#!/bin/bash

function install_modules () {
  echo "$(tput setaf 3)Installing useful Node modules through NPM..."

  # TODO use parse function instead of this super long hard-coded array
  declare -a modules=(
    coffee-script
    less
    stylus
    bower
    yo
    generator-webapp
    generator-gulp-webapp
    grunt-cli
    grunt-init
    gulp
    browser-sync
    http-server
    prettyjson
    requirejs
    uglify-js
  )

 for i in "${modules[@]}"
  do
    :
    echo "Installing $i..."
    npm install -g $i
  done
}

install_modules
