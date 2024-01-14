#!/usr/bin/env zsh

#zmodload zsh/zprof

# TODO: Use autoload instead of sourcing
source ${ZDOTDIR}/zshrc/logging.zsh

# Depends on: Homebrew
if ! type brew >/dev/null 2>&1; then
  log.error "Homebrew is not installed"
  return 1
fi

function brew_require() {
  local command=$1
  local formula=${2:-$command}

  # Check if command is already installed
  if type ${command} >/dev/null 2>&1; then
    log.debug "${command} is installed"
    return 0
  fi

  # Install command using Homebrew
  log.info "${command} is not installed"
  log.info "Installing ${formula} using Homebrew..."
  brew install ${formula} &>/dev/null || {
    log.error "Failed to install ${formula}"
    return 1
  }
  log.info "${command} is installed"
}

# Depends on: sheldon
brew_require sheldon || return 1
eval "$(sheldon source)"

unset -f brew_require
#zprof
