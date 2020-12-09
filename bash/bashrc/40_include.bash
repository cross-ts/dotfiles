#!/usr/bin/env bash

if ! executable brew; then
  return 0
fi

if executable anyenv; then
  source ${DOTCACHE}/anyenv.init.bash
fi

if executable fzf; then
  source ${BREW_PREFIX}/opt/fzf/shell/key-bindings.bash
fi

if executable git; then
  source ${BREW_PREFIX}/opt/git/etc/bash_completion.d/git-prompt.sh
fi
