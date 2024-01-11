#!/usr/bin/env zsh

#zmodload zsh/zprof

# TODO: Use autoload instead of sourcing
source ${ZDOTDIR}/zshrc/logging.zsh

# Depends on: Homebrew
if ! type brew >/dev/null 2>&1; then
  log.error "Homebrew is not installed"
  return 1
fi

# Depends on: sheldon
if ! type sheldon >/dev/null 2>&1; then
  log.info "sheldon is not installed"
  log.info "Installing sheldon via Homebrew..."
  brew install sheldon &>/dev/null || {
    log.error "Failed to install sheldon"
    return 1
  }
  log.info "sheldon installed"
fi
eval "$(sheldon source)"

abbr load -f

#zprof
