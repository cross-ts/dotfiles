#!/usr/bin/env zsh

### docker ###
export DOCKER_BUILDKIT=1
export COMPOSE_DOCKER_CLI_BUILD=1

### history ###
export HISTFILE=${HOME}/.zsh_history
export HISTSIZE=10000
export SAVEHIST=10000000

### brew commands ###
source ${DOTCACHE}/brew.shellenv
if executable brew; then
  debug "brew executable"
  export BREW_PREFIX=$(cat ${DOTCACHE}/brew.prefix)
  export MANPATH="${BREW_PREFIX}/share/man:${MANPATH}"
  export INFOPATH="${BREW_PREFIX}/share/info:${INFOPATH}"
  add_path "${BREW_PREFIX}/sbin"
  add_path "${BREW_PREFIX}/bin"
fi

### subcommands ###
add_path "${DOTPATH}/subcommands/git"
add_path "${DOTPATH}/subcommands/docker"

### golang ###
export GOPATH=${HOME}
add_path "${GOPATH}/bin"
if [[ ! -e ${GOPATH}/src ]]; then
  info "${GOPATH}/src not found."
  mkdir -p ${GOPATH}/src
  info "${GOPATH}/src created."
fi

### dein
if [[ ! -e ${HOME}/repos ]]; then
  info "${HOME}/repos not found."
  ln -fns ${GOPATH}/src ${HOME}/repos
  info "Create symbolic link : ${HOME}/repos -> ${GOPATH}/src."
fi

### __git_ps1
export GIT_PS1_SHOWUPSTREAM=1
export GIT_PS1_SHOWDIRTYSTATE=1
