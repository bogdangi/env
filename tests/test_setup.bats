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

@test "Check if all VIM plugins are installed" {
  plugins=(
    "scrooloose/nerdtree"
    "altercation/vim-colors-solarized"
    "airblade/vim-gitgutter"
    "tpope/vim-fugitive"
    "vim-airline/vim-airline"
    "vim-airline/vim-airline-themes"
    "dense-analysis/ale"
    "github/Copilot.vim"
    "hashivim/vim-terraform"
  )

  for plugin in "${plugins[@]}"; do
    plugin_dir="$HOME/.vim/bundle/$(basename "$plugin")"
    if [ ! -d "$plugin_dir" ]; then
      echo "VIM plugin $plugin is missing"
      return 1
    fi
  done
}

@test "Check if VIM plugins are functioning correctly" {
  run vim -c "echo 'VIM plugins are functioning correctly'" -c "qa!"
  [ "$status" -eq 0 ]
}
