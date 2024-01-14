#!/usr/bin/env zsh

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

# Depends on: fzf, git
brew require fzf || return 1
brew require git || return 1
eval "$(sheldon source)"

### Z shell
mkdir -p "${XDG_CONFIG_HOME}/zsh"
export HISTFILE="${XDG_STATE_HOME}/zsh/history"
