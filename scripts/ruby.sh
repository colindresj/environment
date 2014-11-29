#!/bin/bash

# Install Rbenv plugins
function install_rbenv_plugins () {
  rbenv_plugins=~/.rbenv/plugins
  if [[ ! -d $rbenv_plugins ]]; then
    mkdir $rbenv_plugins
  fi

  git clone https://github.com/sstephenson/rbenv-default-gems.git $rbenv_plugins/rbenv-default-gems
  git clone https://github.com/rkh/rbenv-update.git $rbenv_plugins/rbenv-update
  git clone https://github.com/ianheggie/rbenv-binstubs.git $rbenv_plugins/rbenv-binstubs
  git clone https://github.com/sstephenson/rbenv-gem-rehash.git $rbenv_plusins/rbenv-gem-rehash
  git clone https://github.com/rkh/rbenv-whatis.git $rbenv_plusins/rbenv-whatis
  git clone https://github.com/rkh/rbenv-use.git $rbenv_plusins/rbenv-use
}

function install_gems () {
  echo "Installing useful gems..."
  gem update --system

  # TODO use parse function instead of this super long hard-coded array
  declare -a gems=(
    annotate
    awesome_print
    berkshelf
    better_errors
    binding_of_caller
    bourbon
    capybara
    capybara-webkit
    chef
    coveralls
    cucumber
    database_cleaner
    dotenv
    httparty
    launchy
    meta_request
    mongo_mapper
    mysql2
    neat
    nokogiri
    pg
    pry-stack_explorer
    pry
    pry-nav
    pry-remote
    rails
    rails-erd
    rainbow
    rspec
    ruby-graphviz
    sass
    selenium-webdriver
    simplecov
    sinatra
    sinatra-contrib
  )

 for gem in "${gems[@]}"
  do
    :
    echo "Installing $gem gem..."
    gem install $gem
  done
}

install_vagrant_plugins () {
  echo "Installing useful vagrant plugins..."

  # TODO use parse function instead of this super long hard-coded array
  declare -a plugins=(
    vagrant-berkshelf
    vagrant-hostmanager
    vagrant-omnibus
  )

 for i in "${plugins[@]}"
  do
    :
    echo "Installing $i..."
    vagrant plugin install $i
  done
}

install_rbenv_plugins

# Install Ruby version and set as global
echo "$(tput setaf 3)Installing Rubies..."
rbenv install $RUBY_DEFAULT
rbenv rehash

echo "Setting Ruby ${RUBY_DEFAULT} as the global version..."
rbenv global $RUBY_DEFAULT

# No longer bundle exec
gem regenerate_binstubs

install_gems

install_vagrant_plugins

# Reload bash
source ~/.bash_profile
