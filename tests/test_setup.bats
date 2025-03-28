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

@test "Check if nerdtree plugin directory exists" {
  [ -d "$HOME/.vim/bundle/nerdtree" ]
}

@test "Check if vim-colors-solarized plugin directory exists" {
  [ -d "$HOME/.vim/bundle/vim-colors-solarized" ]
}

@test "Check if vim-gitgutter plugin directory exists" {
  [ -d "$HOME/.vim/bundle/vim-gitgutter" ]
}

@test "Check if vim-fugitive plugin directory exists" {
  [ -d "$HOME/.vim/bundle/vim-fugitive" ]
}

@test "Check if vim-airline plugin directory exists" {
  [ -d "$HOME/.vim/bundle/vim-airline" ]
}

@test "Check if vim-airline-themes plugin directory exists" {
  [ -d "$HOME/.vim/bundle/vim-airline-themes" ]
}

@test "Check if ale plugin directory exists" {
  [ -d "$HOME/.vim/bundle/ale" ]
}

@test "Check if Copilot.vim plugin directory exists" {
  [ -d "$HOME/.vim/bundle/Copilot.vim" ]
}

@test "Check if vim-terraform plugin directory exists" {
  [ -d "$HOME/.vim/bundle/vim-terraform" ]
}
