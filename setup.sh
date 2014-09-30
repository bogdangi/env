#!/bin/bash

setup_dir=`pwd`

# Set vimrc
ln -sf $setup_dir/vimrc $HOME/.vimrc

# Get Vundle
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Install plugins
echo ":PluginInstall" | vim
