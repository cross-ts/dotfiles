#!/usr/bin/env bash

# colors
function black() {
  echo -e "\e[00;30m$@\e[0m"
}

function red() {
  echo -e "\e[00;31m$@\e[0m"
}

function green() {
  echo -e "\e[00;32m$@\e[0m"
}

function yellow() {
  echo -e "\e[00;33m$@\e[0m"
}

function blue() {
  echo -e "\e[00;34m$@\e[0m"
}

function magenta() {
  echo -e "\e[00;35m$@\e[0m"
}

function cyan() {
  echo -e "\e[00;36m$@\e[0m"
}

function white() {
  echo -e "\e[01;37m$@\e[0m"
}

# logging
function now() {
  echo $(date --rfc-3339 'seconds')
}

function log() {
  if [[ $1 = "" ]]; then
    error "Argument Error: too few argument"
    error  "Usage: log LOGLEVEL message"
    return 1
  fi

  case $1 in
    debug|info|notice|warn|error)
      local label=$1
      shift
      ;;
    *)
      error "Argument Error: unknown LOGLEVEL $1"
      error  "Usage: log LOGLEVEL message"
      return 1
      ;;
  esac

  echo "[$(now)] [${label:u}]: $@"
}

function success() {
  green $(log info $@)
}

function debug() {
  if [[ ${ENABLE_DEBUG} = 1 ]]; then
    white $(log debug $@)
  fi
}

function info() {
  white $(log info $@)
}

function notice() {
  cyan $(log notice $@)
}

function warn() {
  yellow $(log warn $@)
}

function error() {
  red $(log error $@) 1>&2
}

# OS detecting
function os() {
  case ${OSTYPE} in
    *linux*) echo linux ;;
    *darwin*) echo osx ;;
    *bsd*) echo bsd ;;
    *) error "unknown" && return 1;;
  esac
}

function is_linux() {
  [[ $(os) = "linux" ]]
}

function is_osx() {
  [[ $(os) = "osx" ]]
}

function is_bsd() {
  [[ $(os) = "bsd" ]]
}

function executable() {
  if [[ $1 = "" ]]; then
    error "too few argument"
    return 1
  fi
  type $1>/dev/null 2>&1
}

function add_path() {
  if [[ $1 = "" ]]; then
    error "too few argument"
    return 1
  fi
  export PATH="$1:${PATH}"
}
