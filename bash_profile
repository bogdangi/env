#!/usr/bin/env bash

# Improvement for the promt

parse_git_branch() {
        git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

# helper functions for Bash - easier coloring than using escape sequences
function Background() {
  echo "\[$(tput setab $1)\]"
}
function Color() {
  echo "\[$(tput setaf $1)\]"
}
function ResetColor() {
  echo "\[$(tput sgr0)\]"
}

# now you can add it to your prompt like this:
# function which configures the prompet...
function BashPrompt() {
    local last_status=$?
    local reset=$(ResetColor)

    local failure="✘"
    local success="✔"

    if [[ "$last_status" != "0" ]]; then
        last_status="$(Color 5)$failure$reset"
    else
        last_status="$(Color 2)$success$reset"
    fi

    git_branch="$(Color 5)$(parse_git_branch)$reset"
    k8s_context="$(Background 4)$(Color 7)$(kubectl config get-contexts --output=name)$reset"

    echo "$last_status \u@\h:\w $git_branch $k8s_context\n$ "
}

# ...and the hook which updates the prompt whenever we run a command
PROMPT_COMMAND='PS1=$(BashPrompt)'

PATH=$PATH:$HOME/bin

# git completion
if [ -f $HOME/.git-completion.bash ]; then
        source $HOME/.git-completion.bash
fi


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
