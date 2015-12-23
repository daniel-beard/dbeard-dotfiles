#!/bin/bash

set -ev

# This script installs some misc utils

# Install pathogen
echo "Installing Pathogen"
mkdir -p ~/.vim/autoload ~/.vim/bundle && curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# Install ipython
echo "Installing IPython (Jupyter)"
pip install "ipython[notebook]"

# Install IJulia
echo "Installing IJulia"
julia -e 'Pkg.update(); Pkg.build("IJulia")'

# Set up p4merge as the default git mergetool
cp ./config/p4merge /usr/local/bin/p4merge
git config --global merge.tool p4merge
git config --global mergetool.keepTemporaries false
git config --global mergetool.prompt false
git config --global mergetool.keepBackup false
