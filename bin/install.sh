#!/usr/bin/env bash

set -eux -o pipefail

DOTPATH="${HOME}/dotfiles"
if [[ ! -d "${DOTPATH}" ]]; then
  git clone git@github.com:cross-ts/dotfiles.git "${DOTPATH}"
fi

pushd "${DOTPATH}"
git pull origin main
bin/deploy
