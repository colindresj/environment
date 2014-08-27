#!/bin/bash

subl_settings="${HOME}/Library/Application Support/Sublime Text 2"

# Set Sublime user preferences
user_prefs="Preferences.sublime-settings"

user_keys="Default\ (OSX).sublime-keymap"
cp "$SETTINGS/sublime/$user_prefs" "$subl_settings/Packages/User/$user_prefs"
cp "$SETTINGS/sublime/$user_keys" "$subl_settings/Packages/User/$user_keys"

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
