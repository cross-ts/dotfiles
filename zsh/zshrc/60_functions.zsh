#!/usr/bin/env zsh

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

function _fzf_ghq_look() {
  if ! executable ghq; then
    error "zsh: command not found: ghq"
    return 1
  elif ! executable fzf; then
    error "zsh: command not found: fzf"
    return 1
  fi

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

# snippet検索
function _pet_select() {
  BUFFER=$(pet search --query "$LBUFFER")
  CURSOR=$#BUFFER
  zle redisplay
}
zle -N _pet_select
bindkey '^p' _pet_select
