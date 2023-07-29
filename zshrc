source $HOME/.bash_profile

bindkey "[D" backward-word
bindkey "[C" forward-word
bindkey "^[a" beginning-of-line
bindkey "^[e" end-of-line

autoload -Uz compinit
zstyle ':completion:*' menu select
fpath+=~/.zfunc




