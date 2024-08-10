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
#export ZDOTDIR="${DOTFILES}/.config/zsh"
