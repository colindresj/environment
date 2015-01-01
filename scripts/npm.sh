#!/bin/bash

function install_modules () {
  echo "$(tput setaf 3)Installing useful Node modules through NPM..."

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
    yo
  )

 for i in "${modules[@]}"
  do
    :
    echo "Installing $i..."
    npm install -g $i
  done
}

install_modules
