#!/usr/bin/env bash

if ! executable brew; then
  return 0
fi

if executable git; then
  source ${BREW_PREFIX}/share/zsh/site-functions/git-completion.bash
fi

if executable aws; then
  complete -C $(which aws_completer) aws
fi

if executable kubectl; then
  : # source ${DOTCACHE}/kubectl.completion.bash
fi
