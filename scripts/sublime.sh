#!/bin/bash

dropbox_path="${HOME}/Dropbox/Sublime/Packages/User"
subl_settings="${HOME}/Library/Application Support/Sublime Text 2"

# Set Sublime user preferences and key bindings
user_prefs="Preferences.sublime-settings"
user_keys="Default (OSX).sublime-keymap"

ln -s "$dropbox_path/$user_prefs" "$subl_settings/Packages/User/$user_prefs"
ln -s "$dropbox_path/$user_keys" "$subl_settings/Packages/User/$user_keys"

pkg_settings="Package Control.sublime-settings"
ln -s "$dropbox_path/$pkg_settings" "$subl_settings/Packages/User/$pkg_settings"
