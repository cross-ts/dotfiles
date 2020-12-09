#!/bin/sh

for zshrc in ${ZDOTDIR}/zshrc/*; do
  source ${zshrc}
done
