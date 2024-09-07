#!/usr/bin/env zsh
if [[ ${DOTFILES_DEBUG} == "on" ]]; then
  zmodload zsh/zprof && zprof
fi
autoload -Uz compinit && compinit -C

# Cache directory for zsh
mkdir -p "${ZCACHEDIR}"
function cache.clear() {
  rm -rf "${ZCACHEDIR}"
}

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

bindkey -e

# TODO: この辺なんとかしたい
source ${ZDOTDIR}/zshrc/logging.zsh

# Depends on: Homebrew
if ! type brew >/dev/null 2>&1; then
  log.error "Homebrew is not installed"
  return 1
fi

# TODO: この辺なんとかしたい
source ${ZDOTDIR}/zshrc/brew.zsh

brew require nvim neovim || return 1
export EDITOR="nvim"

# Depends on: sheldon
brew require sheldon || return 1
SHELDON_CACHE="${ZCACHEDIR}/sheldon.cache"
if [[ ! -f "${SHELDON_CACHE}" ]]; then
  log.info "Caching sheldon source"
  sheldon source > "${SHELDON_CACHE}"
  log.info "Cache created"
elif [[ "${XDG_CONFIG_HOME}/sheldon/plugins.toml" -nt "${SHELDON_CACHE}" ]]; then
  log.info "Caching sheldon source"
  sheldon source > "${SHELDON_CACHE}"
  log.info "Cache updated"
fi
source "${SHELDON_CACHE}"
unset SHELDON_CACHE

# Ctrl-s, Ctrl-q等をshellに食われないようにする
stty -ixon
typeset -U PATH

if [[ ${DOTFILES_DEBUG} == "on" ]]; then
  zprof
fi

if [[ ${ZDOTDIR}/.zshrc -nt ${ZDOTDIR}/.zshrc.zwc ]]; then
  log.info "Recompiling zshrc"
  zcompile ${ZDOTDIR}/.zshrc
  log.info "Recompiled"
fi
