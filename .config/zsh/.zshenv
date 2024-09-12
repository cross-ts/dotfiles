#!/usr/bin/env zsh

# My dotfiles
export DOTFILES="${HOME}/dotfiles"
export DOTFILES_DEBUG=off

# XDG Base Directory Specification
# See: https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html
export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_CACHE_HOME="${HOME}/.cache"
export XDG_DATA_HOME="${HOME}/.local/share"
export XDG_STATE_HOME="${HOME}/.local/state"

# Z Shell
export ZDOTDIR="${XDG_CONFIG_HOME}/zsh"
export ZCACHEDIR="${XDG_CACHE_HOME}/zsh"
export ZSTATEDIR="${XDG_STATE_HOME}/zsh"

# History
export HISTFILE="${ZSTATEDIR}/history"
export HISTSIZE=10000
export SAVEHIST=10000000

# Homebrew
export HOMEBREW_PREFIX=$([[ "$(uname -m)" = "arm64" ]] && echo "/opt/homebrew" || echo "/usr/local")
export HOMEBREW_CELLAR="${HOMEBREW_PREFIX}/Cellar";
export HOMEBREW_REPOSITORY="${HOMEBREW_PREFIX}";
export PATH="${HOMEBREW_PREFIX}/bin:${HOMEBREW_PREFIX}/sbin${PATH+:$PATH}";
export MANPATH="${HOMEBREW_PREFIX}/share/man${MANPATH+:$MANPATH}:";
export INFOPATH="${HOMEBREW_PREFIX}/share/info:${INFOPATH:-}";
export HOMEBREW_BUNDLE_FILE="${XDG_CONFIG_HOME}/homebrew/bundle"
