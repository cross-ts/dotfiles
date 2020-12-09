if &compatible
  set nocompatible
endif

let s:go_src_path = expand("$HOME/src")
if !isdirectory(s:go_src_path)
  execute '!mkdir -p ' s:go_src_path
endif

" deinで持ってくるpluginがgo/ghqで使うdirectoryと同じ場所に入るようにする
let s:repos_path = expand("$HOME/repos")
if !isdirectory(s:repos_path)
  execute 'ln -fsnv ' s:go_src_path s:repos_path
endif

let s:plugins_path = s:go_src_path . '/../'
let s:dein_repo_path = s:plugins_path . 'repos/github.com/Shougo/dein.vim'

" deinが存在しない場合はcloneしてくる
if !isdirectory(s:dein_repo_path)
  execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_path
endif

execute 'set runtimepath^=' . s:dein_repo_path

let s:vim_path = expand("$HOME/dotfiles/.vim")
let s:toml_dir = s:vim_path . '/userautoload/dein'
let s:toml_path = s:toml_dir . '/plugins.toml'
let s:lazy_toml_path = s:toml_dir . '/plugins_lazy.toml'
let g:dein#auto_recache = 1

if dein#load_state(s:plugins_path)
  let g:dein#cache_directory = expand("$HOME/.cache/dein")
  call dein#begin(s:plugins_path)
  call dein#load_toml(s:toml_path, {'lazy': 0})
  call dein#load_toml(s:lazy_toml_path, {'lazy': 1})
  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif
