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

# TODO: この辺なんとかしたい
source ${ZDOTDIR}/zshrc/logging.zsh
source ${ZDOTDIR}/zshrc/brew.zsh

# Depends on: Homebrew
if ! type brew >/dev/null 2>&1; then
  log.error "Homebrew is not installed"
  return 1
fi

# Depends on: sheldon
brew require sheldon || return 1
eval "$(sheldon source)"

# pet
function _pet_select() {
  BUFFER=$(pet search --query "$LBUFFER")
  CURSOR=$#BUFFER
  zle redisplay
}
zle -N _pet_select
bindkey '^p' _pet_select

# Ctrl-s, Ctrl-q等をshellに食われないようにする
stty -ixon

typeset -U PATH
