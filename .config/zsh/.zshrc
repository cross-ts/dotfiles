#!/usr/bin/env zsh

#zmodload zsh/zprof

source ${ZDOTDIR}/zshrc/logging.zsh

log.error "This is an error message"
log.warn "This is a warning message"
log.info "This is an info message"
log.debug "This is a debug message"

#zprof
