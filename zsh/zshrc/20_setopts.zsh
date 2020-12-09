#!/usr/bin/env zsh

# 同時起動のzsh間でhistoryを共有する
setopt share_history

# 同じコマンドをhistoryに残さない
setopt hist_ignore_all_dups

# スペースから始まるコマンドをhistoryに残さない
setopt hist_ignore_space

# history保存時に余分なspaceを削除する
setopt hist_reduce_blanks

# historyに時刻を追加する
setopt EXTENDED_HISTORY

# コマンド実行後に右プロンプトを自動的に消す
setopt transient_rprompt

# prompt変数内で変数参照する
setopt prompt_subst
