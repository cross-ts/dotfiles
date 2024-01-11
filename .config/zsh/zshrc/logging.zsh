#!/usr/bin/env zsh

function log.error() {
  echo "\e[0;97;101m[ERROR]\e[0m ${@}" >&2
}

function log.warn() {
  echo "\e[0;97;103m[WARN]\e[0m ${@}"
}

function log.info() {
  echo "\e[0;97;104m[INFO]\e[0m ${@}"
}

function log.debug() {
  echo "\e[0;97;100m[DEBUG]\e[0m ${@}"
}
