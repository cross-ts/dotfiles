#!/usr/bin/env zsh

export DOTCACHE="${HOME}/.cache/dotfiles.d/zsh"

function .cache() {
  case $1 in
    clean|clear)
      info "Remove : ${DOTCACHE}"
      rm -r ${DOTCACHE} &>/dev/null
      info "Remove : ${ZDOTDIR}/.zshrc.zwc"
      rm -f "${ZDOTDIR}/.zshrc.zwc" &>/dev/null
      ;;
    create)
      info "Create : ${DOTCACHE}"
      info "Create : ${ZDOTDIR}/.zshrc.zwc"
      source ${ZDOTDIR}/zshrc/01_cache.zsh
      ;;
    help)
      info "Usage: .cache <clean|clear|create|restore|recreate>"
      ;;
    restore|recreate)
      .cache clean
      .cache create
      ;;
    *)
      error "Unknown subcommand : .cache $1"
      error "Usage: .cache <clean|clear|create|restore|recreate>"
  esac
}

if [[ ! -e ${DOTCACHE} ]]; then
  mkdir -p ${DOTCACHE}
fi

if [[ ! -e "${ZDOTDIR}/.zshrc.zwc" ]]; then
  info "Cache Not found : ${ZDOTDIR}/.zshrc.zwc"
  zcompile ${ZDOTDIR}/.zshrc ${ZDOTDIR}/zshrc/*
  info "Cache Created : ${ZDOTDIR}/.zshrc.zwc"
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

if executable anyenv && [[ ! -e ${DOTCACHE}/anyenv.init.zsh ]]; then
  info "Cache Not found : ${DOTCACHE}/anyenv.init.zsh"
  anyenv init - --no-rehash > ${DOTCACHE}/anyenv.init.zsh
  info "Cache Created : ${DOTCACHE}/anyenv.init.zsh"
fi

if executable kubectl && [[ ! -e ${DOTCACHE}/kubectl.completion.zsh ]]; then
  info "Cache Not found : ${DOTCACHE}/kubectl.completion.zsh"
  kubectl completion zsh > ${DOTCACHE}/kubectl.completion.zsh
  info "Cache Created : ${DOTCACHE}/kubectl.completion.zsh"
fi
