#!/usr/bin/env zsh

function log.error() {
  echo "\e[0;97;41m[ERROR]\e[0m ${@}" >&2
}

function log.warn() {
  echo "\e[0;97;43m[WARN]\e[0m ${@}"
}

function log.info() {
  echo "\e[0;97;44m[INFO]\e[0m ${@}"
}

function log.debug() {
  echo "\e[0;97;45m[DEBUG]\e[0m ${@}"
}
