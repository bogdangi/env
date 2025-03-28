#!/usr/bin/env bash

export PATH=$PATH:$HOME/bin
export LC_ALL=en_US.UTF-8

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
        fi
}
function Color() {
        if [ -n "$ZSH_VERSION" ]; then
                # assume Zsh
                echo "$(tput setaf $1)"
        elif [ -n "$BASH_VERSION" ]; then
                # assume Bash
                echo "\[$(tput setaf $1)\]"
        fi
}
function ResetColor() {
        if [ -n "$ZSH_VERSION" ]; then
                # assume Zsh
                echo "$(tput sgr0)"
        elif [ -n "$BASH_VERSION" ]; then
                # assume Bash
                echo "\[$(tput sgr0)\]"
        fi
}

# now you can add it to your prompt like this:
# function which configures the prompet...
function Prompt() {
    local last_status=$?

    local failure="✘"
    local success="✔"

    local time=$(date +"%H:%M:%S")

    if [[ "$last_status" != "0" ]]; then
            last_status="$(Color 5)$failure$(ResetColor)"
    else
            last_status="$(Color 2)$success$(ResetColor)"
    fi

    KUBE_CURRENT_CONTEXT=$(command -v kubectl >/dev/null 2>&1 && kubectl config current-context)
    export KUBE_CURRENT_CONTEXT

    aws_profile="$(Background 3)$(Color 7)${AWS_VAULT:-$AWS_PROFILE}$(ResetColor)"
    git_branch="$(Color 5)$(parse_git_branch)$(ResetColor)"
    k8s_context="$(Background 4)$(Color 7)$KUBE_CURRENT_CONTEXT$(ResetColor)"

    echo "$time $last_status $USER@$HOST:$PWD"
    second_line="$aws_profile $k8s_context $git_branch"
    # Add conda environment to prompt
    if [ ! -z "$CONDA_DEFAULT_ENV" ]
    then
      second_line+="$(Background 7)$(Color 6)($CONDA_DEFAULT_ENV)$(ResetColor)"
    fi
    [[ "X${second_line}X" != "X  X" ]] && echo $second_line
    echo "$ "
}


# git completion
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"


# AWS specific commands
function aws_docker_login() {
        aws_account_id=$1
        region=$2
        echo "aws ecr get-login-password --region $region | docker login --username AWS --password-stdin ${aws_account_id}.dkr.ecr.${region}.amazonaws.com"
}

# ...and the hook which updates the prompt whenever we run a command
PROMPT_COMMAND='PS1=$(Prompt)'

precmd() {
        eval "$PROMPT_COMMAND"
}

if [ -n "$ZSH_VERSION" ]; then
        # assume Zsh
        autoload -Uz compinit
        compinit
        command -v kubectl && source <(kubectl completion zsh)
elif [ -n "$BASH_VERSION" ]; then
        # assume Bash
        command -v kubectl && source <(kubectl completion zsh)
else
        # asume something else
        echo "Cannot recognize the sh"
fi

[[ -r "$HOME/.custom-aliases" ]] && source $HOME/.custom-aliases
[[ -r "$HOME/.custom_profile" ]] && source $HOME/.custom_profile

# Machine specific
if [ -f $HOME/.bash_profile_this_machine_specific ]; then
        source $HOME/.bash_profile_this_machine_specific
fi

# Terraform specific
export TF_PLUGIN_CACHE_DIR=$HOME/.terraform.d/plugin-cache
export TF_PLUGIN_CACHE_MAY_BREAK_DEPENDENCY_LOCK_FILE=true

# Terragrunt specific
export TG_PROVIDER_CACHE=1
export TG_PROVIDER_CACHE_DIR=$HOME/.terragrunt.d/provider-cache
