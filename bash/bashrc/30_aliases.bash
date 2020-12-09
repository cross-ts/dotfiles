#!/usr/bin/env bash

alias df='df -h'

if executable nvim; then
  alias vi='nvim'
  alias vim='nvim'
fi

if executable tmux; then
  alias t='tmux'
  alias tn='tmux new -s'
  alias ta='tmux attach -t'
  alias tls='tmux ls'
fi

if executable docker; then
  alias d='docker'
  alias hadolint='docker run --rm -i hadolint/hadolint <'
fi

if executable docker-compose; then
  alias dc='docker-compose'
fi

if executable hub; then
  alias hb='hub browse'
fi

if executable git; then
  alias gp='git push'
  alias gs='git status'
fi

if is_linux; then
  alias ll='ls -la --color=auto'
  alias grep='grep --color'
  alias ps='ps aux --sort -rss'
  executable xsel && alias pbcopy='xsel --clipboard --input'
elif is_osx; then
  alias ll="ls -laG"
  alias grep="grep --color=auto"
  alias ps="ps auxm"
  executable gawk && alias awk="gawk"
  executable gsed && alias sed="gsed"
  executable greadlink && alias readlink="greadlink"
  executable gdate && alias date="gdate"
  executable gsort && alias sort="gsort"
  executable gecho && alias echo="gecho"
elif is_bsd; then
  :
else
  error "unknown OS"
fi
