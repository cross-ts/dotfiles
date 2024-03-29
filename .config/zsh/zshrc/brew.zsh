#!/usr/bin/env zsh

function brew-require() {
  local command=$1
  local formula=${2:-$command}

  # Check if command is already installed
  if type ${HOMEBREW_REPOSITORY}/bin/${command} >/dev/null 2>&1; then
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

function brew() {
  case $1 in
    require) brew-require ${@:2} ;;
    *) command brew ${@} ;;
  esac
}

export HOMEBREW_BUNDLE_FILE="${XDG_CONFIG_HOME}/homebrew/bundle"
