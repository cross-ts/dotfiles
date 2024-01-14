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
brew require fzf || return 1
brew require git || return 1
eval "$(sheldon source)"
