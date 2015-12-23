#!/bin/bash

set -ev

# zshrc
echo "Copying .zshrc"
cp dotfiles/.zshrc ~

# Vim
echo "Copying .vimrc"
cp dotfiles/.vimrc ~

echo "Copying Seil configuration"
cp dotfiles/org.pqrs.Seil.plist ~/Library/Preferences/org.pqrs.Seil.plist
