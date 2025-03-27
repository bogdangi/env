# INSTALL
=======

## Install env

./setup.sh

## Purpose

The purpose of this repository is to provide a set of configuration files and scripts to set up a development environment. This includes configurations for various tools such as Vim, Tmux, Bash, Zsh, and Git.

## Usage

To use this repository, clone it to your local machine and run the `setup.sh` script. This will set up the configurations for the various tools.

## Configuration Files

- `bash_profile`: Contains configurations for the Bash shell, including helper functions and prompt configurations.
- `gitconfig`: Contains Git configurations, including aliases and user information.
- `gitignore_global`: Contains global Git ignore rules.
- `tmux.conf`: Contains configurations for Tmux, including key bindings and color settings.
- `vimrc`: Contains configurations for Vim, including plugins and settings.
- `zshrc`: Contains configurations for the Zsh shell, including key bindings and completion settings.

## Dependencies

- Git: Required to clone the repository and for Git configurations.
- Vim: Required for Vim configurations.
- Tmux: Required for Tmux configurations.
- Bash: Required for Bash configurations.
- Zsh: Required for Zsh configurations.

## Examples

To set up the environment, run the following commands:

```sh
git clone https://github.com/bogdangi/env.git
cd env
./setup.sh
```

This will clone the repository, navigate into the repository directory, and run the setup script to configure the environment.
