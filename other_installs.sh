#!/bin/bash

set -ev

# This script installs some misc utils

# Install pathogen
echo "Installing Pathogen"
mkdir -p ~/.vim/autoload ~/.vim/bundle && curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

