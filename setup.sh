#!/bin/bash

setup_dir=`pwd`

# Set vimrc
ln -sf $setup_dir/vimrc $HOME/.vimrc

# Set tmux
ln -sf $setup_dir/tmux.conf $HOME/.tmux.conf

# Get Vundle
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Install plugins
echo ":PluginInstall" | vim

# Git autocomplete
brew install git bash-completion
ln -sf $setup_dir/bash_profile $HOME/.bash_profile

# Git config
ln -sf $setup_dir/gitconfig $HOME/.gitconfig
