# env

Minimal configuration files and setup script for a fast development environment.

## Quick Install
```sh
git clone https://github.com/bogdangi/env.git
cd env
./setup.sh
```

## Includes
- bash_profile
- gitconfig & gitignore_global
- tmux.conf
- vimrc
- zshrc

## Requirements
- Git, Vim, Tmux, Bash, Zsh

## Test
Run setup verification:
```sh
bats tests/test_setup.bats
```
