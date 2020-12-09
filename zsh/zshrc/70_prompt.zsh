#!/usr/bin/env zsh

__time='%{$fg[green]%}[%*]%{${reset_color}%}'
__dirname='%{$fg[red]%}%c%{${reset_color}%}'
if executable __git_ps1; then
  __gitbranch='%{$fg[yellow]%}$(__git_ps1 "(%s) ")%{${reset_color}%}'
else
  __gitbranch=''
fi
__prompt='%{$fg[cyan]%}❭%{${reset_color}%}'

PROMPT="
${__time} ${__dirname} ${__gitbranch}
${__prompt} "
