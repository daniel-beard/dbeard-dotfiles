#!/bin/bash

set -ev

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Install homebrew
./brew.sh

# Install OSX defaults
./osx.sh

# Setup zsh and oh-my-zsh
./zsh.sh

# Copy dotfiles
./copy_dotfiles.sh

# Misc utility installs
./other_installs.sh

# Install atom.io packages
./atom.sh
