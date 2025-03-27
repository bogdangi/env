#!/bin/bash

setup_dir=`pwd`

# Check if symbolic links are created correctly
if [ ! -L $HOME/.vimrc ]; then
  echo "VIM configuration symbolic link not created correctly"
  exit 1
fi

if [ ! -L $HOME/.tmux.conf ]; then
  echo "tmux configuration symbolic link not created correctly"
  exit 1
fi

if [ ! -L $HOME/.bash_profile ]; then
  echo "BASH configuration symbolic link not created correctly"
  exit 1
fi

if [ ! -L $HOME/.zshrc ]; then
  echo "ZSH configuration symbolic link not created correctly"
  exit 1
fi

if [ ! -L $HOME/.gitconfig ]; then
  echo "git configuration symbolic link not created correctly"
  exit 1
fi

if [ ! -L $HOME/.gitignore_global ]; then
  echo "gitignore_global symbolic link not created correctly"
  exit 1
fi

# Check if VIM is configured correctly
if ! grep -q "Plugin 'scrooloose/nerdtree'" $HOME/.vimrc; then
  echo "VIM is not configured correctly"
  exit 1
fi

# Check if tmux is configured correctly
if ! grep -q "set -g default-terminal \"screen-256color\"" $HOME/.tmux.conf; then
  echo "tmux is not configured correctly"
  exit 1
fi

# Check if BASH is configured correctly
if ! grep -q "export PATH=\$PATH:\$HOME/bin" $HOME/.bash_profile; then
  echo "BASH is not configured correctly"
  exit 1
fi

# Check if ZSH is configured correctly
if ! grep -q "source \$HOME/.bash_profile" $HOME/.zshrc; then
  echo "ZSH is not configured correctly"
  exit 1
fi

# Check if git is configured correctly
if ! grep -q "[user]" $HOME/.gitconfig; then
  echo "git is not configured correctly"
  exit 1
fi

echo "All configurations are set up correctly"
