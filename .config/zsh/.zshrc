#!/usr/bin/env zsh
autoload -Uz compinit && compinit -C

# Z shell
mkdir -p "${XDG_STATE_HOME}/zsh"
export HISTFILE="${XDG_STATE_HOME}/zsh/history"
export HISTSIZE=10000
export SAVEHIST=10000000

setopt share_history
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_reduce_blanks
setopt EXTENDED_HISTORY
setopt transient_rprompt

# Depends on: Homebrew
if ! type brew >/dev/null 2>&1; then
  log.error "Homebrew is not installed"
  return 1
fi

# TODO: この辺なんとかしたい
source ${ZDOTDIR}/zshrc/logging.zsh
source ${ZDOTDIR}/zshrc/brew.zsh

# Depends on: sheldon
brew require sheldon || return 1
eval "$(sheldon source)"

# Ctrl-s, Ctrl-q等をshellに食われないようにする
stty -ixon
typeset -U PATH
