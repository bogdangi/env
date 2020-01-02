#!/bin/bash

setup_dir=`pwd`

# Configure VIM
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
ln -sf $setup_dir/vimrc $HOME/.vimrc
echo ":PluginInstall" | vim

# Configure tmux
ln -sf $setup_dir/tmux.conf $HOME/.tmux.conf

# Configure BASH
ln -sf $setup_dir/bash_profile $HOME/.bash_profile

# Configurre ZSH
ln -sf $setup_dir/zshrc $HOME/.zshrc

# Configure git
ln -sf $setup_dir/gitconfig $HOME/.gitconfig
ln -sf $setup_dir/gitignore_global $HOME/.gitignore_global
ln -sf $setup_dir/git-completion.bash $HOME/.git-completion.bash
