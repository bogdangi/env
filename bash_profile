#!/usr/bin/env bash

# Improvement for the promt

parse_git_branch() {
        git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

# helper functions for Bash - easier coloring than using escape sequences
function Background() {
        if [ -n "$ZSH_VERSION" ]; then
                # assume Zsh
                echo "$(tput setab $1)"
        elif [ -n "$BASH_VERSION" ]; then
                # assume Bash
                echo "\[$(tput setab $1)\]"
        else
                # asume something else
        fi
}
function Color() {
        if [ -n "$ZSH_VERSION" ]; then
                # assume Zsh
                echo "$(tput setaf $1)"
        elif [ -n "$BASH_VERSION" ]; then
                # assume Bash
                echo "\[$(tput setaf $1)\]"
        else
                # asume something else
        fi
}
function ResetColor() {
        if [ -n "$ZSH_VERSION" ]; then
                # assume Zsh
                echo "$(tput sgr0)"
        elif [ -n "$BASH_VERSION" ]; then
                # assume Bash
                echo "\[$(tput sgr0)\]"
        else
                # asume something else
        fi
}

# now you can add it to your prompt like this:
# function which configures the prompet...
function Prompt() {
    local last_status=$?
    local reset=$(ResetColor)

    local failure="✘"
    local success="✔"
    local time=$(date +"%H:%M:%S")

    if [[ "$last_status" != "0" ]]; then
        last_status="$(Color 5)$failure$reset"
    else
        last_status="$(Color 2)$success$reset"
    fi

    git_branch="$(Color 5)$(parse_git_branch)$reset"
    k8s_context="$(Background 4)$(Color 7)$(kubectl config get-contexts --output=name)$reset"

    echo "$time $last_status $USER@$HOST:$PWD $git_branch $k8s_context\n$ "
}

# ...and the hook which updates the prompt whenever we run a command
PROMPT_COMMAND='PS1=$(Prompt)'
precmd() { eval "$PROMPT_COMMAND" }

PATH=$PATH:$HOME/bin

# git completion
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"


# Kubectl shell completion
if [ -f $HOME/.kube/completion.bash.inc ]; then
        source $HOME/.kube/completion.bash.inc
fi

# AWS specific commands
function aws_docker_login() {
        $(aws ecr  get-login --no-include-email)
}

# Machine specific
if [ -f $HOME/.bash_profile_this_machine_specific ]; then
        source $HOME/.bash_profile_this_machine_specific
fi

[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"
