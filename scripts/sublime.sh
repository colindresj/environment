#!/bin/bash

subl_settings="${HOME}/Library/Application Support/Sublime Text 2"

# Set Sublime user preferences
user_prefs="Preferences.sublime-settings"

# TODO update user keymap for close on slash
user_keys="Default\ (OSX).sublime-keymap"
cp "$SETTINGS/sublime/$user_prefs" "$subl_settings/Packages/User/$user_prefs"
cp "$SETTINGS/sublime/$user_keys" "$subl_settings/Packages/User/$user_keys"

# Close tag on slash
close_1="close_tag_on_slash.py"
close_2="close_tag_on_slash.pyc"
cp "$SETTINGS/sublime/$close_1" "$subl_settings/Packages/User/$close_1"
cp "$SETTINGS/sublime/$close_2" "$subl_settings/Packages/User/$close_2"

# Installing Package Control
pkg_url="https://sublime.wbond.net/Package%20Control.sublime-package"
curl -o $subl_settings/Installed Packages/Package\ Control.sublime-package "$pkg_url"

# TODO improve packages not installed through package control
# Set packages that should be auto-installed on first open
pkg_settings="Package Control.sublime-settings"
cp "$SETTINGS/sublime/$pkg_settings" "$subl_settings/Packages/User/$pkg_settings"

# Set Fetch preferences
fetch_prefs="Fetch.sublime-settings"
cp "$SETTINGS/sublime/$fetch_prefs" "$subl_settings/Packages/User/$fetch_prefs"

# Copy over snippets
cp -a "$SETTINGS/sublime/snippets/." "$subl_settings/Packages/User/"
