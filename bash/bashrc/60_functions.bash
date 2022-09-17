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
  for i in {000..255} ; do
    printf "\x1b[38;5;${i}m${i} "
    [ $(($i%16)) -eq 15 ] && echo
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

function aws() {
  case $1 in
    account) aws-account ${@:2} ;;
    ec2) aws-ec2 ${@:2} ;;
    *) command aws $@ ;;
  esac
}

function bat() {
  if [[ ! -e ${HOME}/.cache/bat ]]; then
    command bat cache --build
  fi
  command bat $@
}
