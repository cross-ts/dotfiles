#!/usr/bin/env zsh

if ! executable brew; then
  return 0
fi

add_fpath "${BREW_PREFIX}/share/zsh-completions"

if executable git; then
  add_fpath "${BREW_PREFIX}/share/zsh/site-functions/_git"
  add_fpath "${BREW_PREFIX}/share/zsh/site-functions/git-completion.bash"
fi

if executable aws; then
  add_fpath "${BREW_PREFIX}/share/zsh/site-functions/_aws"
fi

if executable kubectl; then
  : # source ${DOTCACHE}/kubectl.completion.zsh
fi
