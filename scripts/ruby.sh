# Install ruby version and set as global
echo "Installing Rubies..."
rbenv install $RUBY_DEFAULT

echo "Setting Ruby ${RUBY_DEFAULT} as the global version..."
rbenv global $RUBY_DEFAULT

# Reload bash
source ~/.bash_profile
