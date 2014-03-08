function setup_brew () {
  echo "Installing Homebrew..."
  # ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go/install)"

  brew update
  brew doctor
}

function install_formulae () {
  echo "Tapping homebrew/dupes..."
  # brew tap homebrew/dupes

  echo "Installing useful formulae..."

  # TODO use parse function instead of this super long hard-coded array
  declare -a formulae=(apple-gcc42 autoconf automake git hub graphviz cmatrix irssi imagemagick mongodb postgresql mysql node redis pianobar openssl qt readline rbenv ruby-build rbenv-gem-rehash libyaml pkg-config)

  for i in "${formulae[@]}"
  do
    :
    echo "Installing $i formula..."
    # brew install $i
  done
}

setup_brew
install_formulae


