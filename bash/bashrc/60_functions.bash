#!/usr/bin/env bash

function cdf() {
  if ! executable fzf; then
    error "command not found: fzf"
    return 1
  fi
  local selected=$(find -L . -maxdepth 1 -type d | cut -d'/' -f2- | grep -v '^\.$' | fzf --ansi --height 40%)
  local ret=$?
  if [[ -n $selected ]]; then
    cd $selected
  else
    : # noop
  fi
  return $ret
}

function colors256() {
  for c in {000..255}; do
    echo -n "\e[38;5;${c}m $c"
    [ $(($c%16)) -eq 15 ] && echo
  done
  echo
}

function docker() {
  case $1 in
    sh | ash | bash) docker-sh $1 ;;
    clean) docker-clean ;;
    *) command docker $@ ;;
  esac
}

function bat() {
  if [[ ! -e ${HOME}/.cache/bat ]]; then
    command bat cache --build
  fi
  command bat $@
}
