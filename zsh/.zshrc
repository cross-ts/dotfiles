#!/bin/sh
if [[ ${ENABLE_DEBUG} = 1 ]]; then
  zmodload zsh/zprof
fi

for zshrc in ${ZDOTDIR}/zshrc/*; do
  source ${zshrc}
done

if [[ ${ENABLE_DEBUG} = 1 ]]; then
  zprof
fi
