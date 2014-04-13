function setup_brew () {
  echo "Installing Homebrew..."
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

  echo "Installing useful formulae..."

  # TODO use parse function instead of this super long hard-coded array
  declare -a formulae=(
    brew-cask
    apple-gcc42
    autoconf
    automake
    git
    hub
    graphviz
    cmatrix
    irssi
    imagemagick
    mongodb
    postgresql
    mysql
    node
    redis
    pianobar
    openssl
    qt
    readline
    rbenv
    ruby-build
    rbenv-gem-rehash
    libyaml
    pkg-config
    wget
    terminal-notifier
  )

  for i in "${formulae[@]}"
  do
    :
    echo "Installing $i formula..."
    brew install $i
  done
}

function install_casks () {
  echo "Installing useful apps through brew cask..."

  # TODO use parse function instead of this super long hard-coded array
  declare -a casks=(
    google-chrome
    firefox
    opera
    alfred
    dropbox
    layervault
    the-unarchiver
    flux
    cloud
    spectacle
    recordit
    clipmenu
    dash
    sublime-text
    macvim
    mou
    sketch
    fontprep
    heroku-toolbelt
    virtualbox
    postgres
    vagrant
    spotify
    slack
    skype
    vlc
    qlcolorcode
    qlstephen
    qlmarkdown
    quicklook-json
  )

  for i in "${casks[@]}"
  do
    :
    echo "Installing $i..."
    brew cask install $i
  done
}

hide_alias_arrow () {
  `sudo mv /System/Library/CoreServices/CoreTypes.bundle/Contents/Resources/AliasBadgeIcon.icns /System/Library/CoreServices/CoreTypes.bundle/Contents/Resources/AliasBadgeIcon-bak.icns`
  echo "Removed symlink arrow from applications"
}

setup_brew
install_formulae
# install_casks
# hide_alias_arrow


