#!/usr/bin/env bash

__time="\e[00;32m[\t]\e[0m"
__dirname="\e[00;31m\W\e[0m"
if executable __git_ps1; then
  __gitbranch="\e[00;33m$(__git_ps1 '(%s)')\e[0m"
else
  __gitbranch=""
fi
__prompt="\e[00;36m❯ \e[0m"

PS1="
$__time $__dirname $__gitbranch
$__prompt"
