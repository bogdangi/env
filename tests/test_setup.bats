#!/usr/bin/env bats

setup() {
  setup_dir=$(pwd)
}

@test "Check if symbolic links are created correctly" {
  [ -L "$HOME/.vimrc" ]
  [ -L "$HOME/.tmux.conf" ]
  [ -L "$HOME/.bash_profile" ]
  [ -L "$HOME/.zshrc" ]
  [ -L "$HOME/.gitconfig" ]
  [ -L "$HOME/.gitignore_global" ]
}

@test "Check if VIM is configured correctly" {
  run grep "Plugin 'scrooloose/nerdtree'" "$HOME/.vimrc"
  [ "$status" -eq 0 ]
}

@test "Check if tmux is configured correctly" {
  run grep "set -g default-terminal \"screen-256color\"" "$HOME/.tmux.conf"
  [ "$status" -eq 0 ]
}

@test "Check if BASH is configured correctly" {
  run grep "export PATH=\$PATH:\$HOME/bin" "$HOME/.bash_profile"
  [ "$status" -eq 0 ]
}

@test "Check if ZSH is configured correctly" {
  run grep "source \$HOME/.bash_profile" "$HOME/.zshrc"
  [ "$status" -eq 0 ]
}

@test "Check if git is configured correctly" {
  run grep "[user]" "$HOME/.gitconfig"
  [ "$status" -eq 0 ]
}

@test "Check if VIM plugin scrooloose/nerdtree is installed" {
  plugin_dir="$HOME/.vim/bundle/nerdtree"
  [ -d "$plugin_dir" ] || { echo "Plugin scrooloose/nerdtree is missing"; return 1; }
}

@test "Check if VIM plugin altercation/vim-colors-solarized is installed" {
  plugin_dir="$HOME/.vim/bundle/vim-colors-solarized"
  [ -d "$plugin_dir" ] || { echo "Plugin altercation/vim-colors-solarized is missing"; return 1; }
}

@test "Check if VIM plugin airblade/vim-gitgutter is installed" {
  plugin_dir="$HOME/.vim/bundle/vim-gitgutter"
  [ -d "$plugin_dir" ] || { echo "Plugin airblade/vim-gitgutter is missing"; return 1; }
}

@test "Check if VIM plugin tpope/vim-fugitive is installed" {
  plugin_dir="$HOME/.vim/bundle/vim-fugitive"
  [ -d "$plugin_dir" ] || { echo "Plugin tpope/vim-fugitive is missing"; return 1; }
}

@test "Check if VIM plugin vim-airline/vim-airline is installed" {
  plugin_dir="$HOME/.vim/bundle/vim-airline"
  [ -d "$plugin_dir" ] || { echo "Plugin vim-airline/vim-airline is missing"; return 1; }
}

@test "Check if VIM plugin vim-airline/vim-airline-themes is installed" {
  plugin_dir="$HOME/.vim/bundle/vim-airline-themes"
  [ -d "$plugin_dir" ] || { echo "Plugin vim-airline/vim-airline-themes is missing"; return 1; }
}

@test "Check if VIM plugin dense-analysis/ale is installed" {
  plugin_dir="$HOME/.vim/bundle/ale"
  [ -d "$plugin_dir" ] || { echo "Plugin dense-analysis/ale is missing"; return 1; }
}

@test "Check if VIM plugin github/Copilot.vim is installed" {
  plugin_dir="$HOME/.vim/bundle/Copilot.vim"
  [ -d "$plugin_dir" ] || { echo "Plugin github/Copilot.vim is missing"; return 1; }
}

@test "Check if VIM plugin hashivim/vim-terraform is installed" {
  plugin_dir="$HOME/.vim/bundle/vim-terraform"
  [ -d "$plugin_dir" ] || { echo "Plugin hashivim/vim-terraform is missing"; return 1; }
}

@test "Check if VIM plugins are functioning correctly" {
  run vim -c "echo 'VIM plugins are functioning correctly'" -c "qa!"
  [ "$status" -eq 0 ]
}
