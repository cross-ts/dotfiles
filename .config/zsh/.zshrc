#!/usr/bin/env zsh

# TODO: この辺なんとかしたい
source ${ZDOTDIR}/zshrc/logging.zsh
source ${ZDOTDIR}/zshrc/brew.zsh

# Depends on: Homebrew
if ! type brew >/dev/null 2>&1; then
  log.error "Homebrew is not installed"
  return 1
fi

# Depends on: sheldon
brew require sheldon || return 1

# Depends on: fzf, git
brew require fzf || return 1
brew require git || return 1
eval "$(sheldon source)"

### Z shell
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
setopt prompt_subst

# git subcommands
export PATH="${DOTFILES}/subcommands/git:${PATH}"

# ghq
mkdir -p "${HOME}/repos"
function _fzf_ghq_look() {
  local selected=$(ghq list | fzf --ansi --height 40%)
  local ret=$?
  if [ -n "$selected" ]; then
    cd "$(ghq root)/${selected}"
    zle accept-line
  else
    zle reset-prompt
  fi
  return $ret
}
zle     -N   _fzf_ghq_look
bindkey '^G' _fzf_ghq_look

# pet
function _pet_select() {
  BUFFER=$(pet search --query "$LBUFFER")
  CURSOR=$#BUFFER
  zle redisplay
}
zle -N _pet_select
bindkey '^p' _pet_select

# prompt
__time='%{$fg[green]%}[%*]%{${reset_color}%}'
__dirname='%{$fg[red]%}%c%{${reset_color}%}'
__gitbranch='%{$fg[yellow]%}$(__git_ps1 "(%s) ")%{${reset_color}%}'
__prompt='%{$fg[cyan]%}❭%{${reset_color}%}'

PROMPT="${__time} ${__dirname} ${__gitbranch}
${__prompt} "
unset -v __time __dirname __gitbranch __prompt

# Ctrl-s, Ctrl-q等をshellに食われないようにする
stty -ixon

typeset -U PATH
