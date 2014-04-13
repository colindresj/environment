#!/bin/bash

osx_version=$(sw_vers -productVersion)
echo "You're running OSX $osx_version"

# Check that command line tools are installed
case $osx_version in
  *10.9*) cmdline_version="CLTools_Executables" ;; # Mavericks
  *10.8*) cmdline_version="DeveloperToolsCLI"   ;; # Mountain Lion
  *) echo "Please upgrade your OS"; exit 1;;
esac

# Check for Command Line Tools based on OS versions
if [[ ! -z $(pkgutil --pkgs=com.apple.pkg.$cmdline_version) ]]; then
  echo "Command Line Tools are installed";
elif [[ $osx_version < "10.9" ]]; then
  echo "Command Line Tools are not installed."
  echo "Register for a Developer Account."
  echo "Download the Command Lion Tools from: https://developer.apple.com/downloads/index.action"
  echo "Or, if you have XCode, you can download by going to Preferences > Downloads"
  echo "Rerun this script after installation."
  exit 1
else
  echo "Command Line Tools are not installed."
  echo "Running '$ git' should bring up a dialog to install the command line tools."
  echo "Rerun this script after installation."
  exit 1
fi
