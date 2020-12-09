#!/usr/bin/env zsh

if ! executable brew; then
  return 0
fi

if executable anyenv; then
  source ${DOTCACHE}/anyenv.init.zsh
fi

if executable fzf; then
  source ${BREW_PREFIX}/opt/fzf/shell/key-bindings.zsh
fi

if executable git; then
  source ${BREW_PREFIX}/opt/git/etc/bash_completion.d/git-prompt.sh
fi

if [[ -e ${BREW_PREFIX}/share/zsh-syntax-highlighting ]]; then
  source ${BREW_PREFIX}/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
  ZSH_HIGHLIGHT_STYLES[path]='none'
  ZSH_HIGHLIGHT_STYLES[alias]='fg=cyan,bold'
  ZSH_HIGHLIGHT_STYLES[arg0]='fg=cyan,bold'
fi
