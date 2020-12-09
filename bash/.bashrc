#!/bin/sh

for bashrc in ${BDOTDIR}/bashrc/*; do
  source ${bashrc}
done
