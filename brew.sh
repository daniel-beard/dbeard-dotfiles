#!/usr/bin/env bash

set -ev

# Install brew
#TODO: Check that brew is not already installed.
command -v brew >/dev/null 2>&1 || { 
    echo "brew is not installed, attempting to install."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" < /dev/null
}


# Install command-line tools using Homebrew.

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade --all

# Install GNU core utilities (those that come with OS X are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names

# Install `wget` with IRI support.
brew install wget --with-iri

# Install more recent versions of some OS X tools.
brew install vim --override-system-vi

# Install other useful binaries.
brew install ack
brew install dark-mode
brew install git
brew install imagemagick --with-webp
brew install lua
brew install p7zip
brew install pv
brew install speedtest_cli
brew install ssh-copy-id
brew install zeromq
brew install pkg-config
brew install python # also installs pip
brew install gpg
brew install redis
brew install ansible

# Remove outdated versions from the cellar.
brew cleanup

# Brew cask
##############################################

# Install cask
brew tap caskroom/cask
brew tap caskroom/versions

brew cask install --appdir=/Applications atom
brew cask install --appdir=/Applications alfred
brew cask install --appdir=/Applications dropbox
brew cask install --appdir=/Applications spotify
brew cask install --appdir=/Applications coderunner
brew cask install --appdir=/Applications iterm2-beta
brew cask install --appdir=/Applications hipchat
brew cask install --appdir=/Applications bettertouchtool
brew cask install --appdir=/Applications sourcetree
brew cask install --appdir=/Applications flux
brew cask install --appdir=/Applications seil
brew cask install --appdir=/Applications karabiner
brew cask install --appdir=/Applications julia
brew cask install --appdir=/Applications p4merge
brew cask install --appdir=/Applications dockertoolbox
brew cask install --appdir=/Applications reveal

# Add julia to path
ln -fs "`ls /Applications/Julia*/Contents/Resources/julia/bin/julia`" /usr/local/bin/julia

brew cask cleanup

# Brew Fonts
##############################################
brew tap caskroom/fonts 

# Powerline patched font
brew cask install font-inconsolata-for-powerline

# Brew Services
##############################################

brew tap homebrew/services

brew services start redis
