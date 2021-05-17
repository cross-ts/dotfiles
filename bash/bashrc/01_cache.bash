#!/usr/bin/env bash

export DOTCACHE="${HOME}/.cache/dotfiles.d/bash"

function .cache() {
  case $1 in
    clean|clear)
      info "Remove : ${DOTCACHE}"
      rm -r ${DOTCACHE} &>/dev/null
      ;;
    create)
      info "Create : ${DOTCACHE}"
      source ${BDOTDIR}/bashrc/01_cache.bash
      ;;
    restore|recreate)
      .cache clean
      .cache create
      ;;
    help)
      info "Usage: .cache <clean|clear|create|restore|recreate>"
      ;;
    *)
      error "Unknown subcommand : .cache $1"
      error "Usage: .cache <clean|clear|create|restore|recreate>"
  esac
}

if [[ ! -e ${DOTCACHE} ]]; then
  mkdir -p ${DOTCACHE}
fi

if ! executable brew; then
  return 0
fi

if [[ ! -e ${DOTCACHE}/brew.shellenv ]]; then
  info "Cache Not found : ${DOTCACHE}/brew.shellenv"
  brew shellenv > ${DOTCACHE}/brew.shellenv
  info "Cache Created : ${DOTCACHE}/brew.shellenv"
fi

if [[ ! -e ${DOTCACHE}/brew.prefix ]]; then
  info "Cache Not found : ${DOTCACHE}/brew.prefix"
  brew --prefix > ${DOTCACHE}/brew.prefix
  info "Cache Created : ${DOTCACHE}/brew.prefix"
fi

if executable anyenv && [[ ! -e ${DOTCACHE}/anyenv.init.bash ]]; then
  info "Cache Not found : ${DOTCACHE}/anyenv.init.zsh"
  anyenv init - --no-rehash > ${DOTCACHE}/anyenv.init.bash
  # NOTE:
  #   * pyenv init - がPATH設定を行わなくなったため
  #   * anyenv側で対応されたら消す
  # See: https://github.com/anyenv/anyenv/issues/90
  if executable pyenv; then
    pyenv init --path >> ${DOTCACHE}/anyenv.init.zsh
  fi
  info "Cache Created : ${DOTCACHE}/anyenv.init.zsh"
fi

if executable kubectl && [[ ! -e ${DOTCACHE}/kubectl.completion.bash ]]; then
  info "Cache Not found : ${DOTCACHE}/kubectl.completion.bash"
  kubectl completion bash > ${DOTCACHE}/kubectl.completion.bash
  info "Cache Created : ${DOTCACHE}/kubectl.completion.bash"
fi
