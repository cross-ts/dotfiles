#!/usr/bin/env zsh
autoload -Uz colors && colors
autoload -Uz compinit
if [[ -e ${ZDOTDIR}/.zcompdump ]]; then
  compinit -C
else
  compinit
fi

# colors
function black() {
  echo "${fg[black]}$@${reset_color}"
}

function red() {
  echo "${fg[red]}$@${reset_color}"
}

function green() {
  echo "${fg[green]}$@${reset_color}"
}

function yellow() {
  echo "${fg[yellow]}$@${reset_color}"
}

function blue() {
  echo "${fg[blue]}$@${reset_color}"
}

function magenta() {
  echo "${fg[magenta]}$@${reset_color}"
}

function cyan() {
  echo "${fg[cyan]}$@${reset_color}"
}

function white() {
  echo "${fg[white]}$@${reset_color}"
}

# logging
function now() {
  echo $(date --rfc-3339 'seconds')
}

function log() {
  case $1 in
    debug|info|notice|warn|error)
      local log_level=$1
      shift
      ;;
    *)
      error "Argument Error: unknown LOGLEVEL $1"
      error  "Usage: log LOGLEVEL message"
      return 1
      ;;
  esac

  echo "time:$(now)\tlevel:${log_level:u}\tmessage:${@}"
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

function add_fpath() {
  if [[ $1 = "" ]]; then
    error "too few argument"
    return 1
  fi
  export FPATH="$1:${FPATH}"
}
