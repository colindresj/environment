copy () {
  echo "Copying $@..."
  # cp "$DOTFILES/$@" "${HOME}/.$@"
}

setup_ssh () {
  if [ ! -d ~/.ssh ]; then
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
  echo "Set IR Black as terminal default"
  sleep 2
  open "$SETTINGS/terminal/IR-Black.terminal"
  read -p "$(tput setaf 4)Press Return when complete >"
  tput sgr0
}

# Own all directories from home and down
# sudo chown -R ${USER} ~

# Copy dotfiles
copy bash_profile
copy gitconfig
copy gitignore_global
copy pryrc

# Reloading the session
source ~/.bash_profile

setup_ssh
setup_terminal
