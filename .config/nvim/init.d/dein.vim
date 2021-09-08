" home directoryにreposを作成して運用する
" NOTE: $GOPATH/srcを使わないようになったのでケアしない
let s:repos_dir = expand('~/repos/')
if !isdirectory(s:repos_dir)
  execute '!mkdir -p ' s:repos_dir
endif

" dein.vimのinstall directory
let s:dein_repo_dir = s:repos_dir . 'github.com/Shougo/dein.vim'

" runtimepathに存在しない場合はpathを通す
if &runtimepath !~ '/dein.vim'
  " deinが未インストールだった場合はcloneしておく
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone --recursive https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath+=' . s:dein_repo_dir
endif

let s:base_path = expand('~/')
let s:toml_dir = expand('~/.config/nvim/toml/')
let s:toml_path = s:toml_dir . 'dein.toml'
let s:lazy_toml_path = s:toml_dir . 'dein_lazy.toml'
let s:filetype_lazy_toml_path = s:toml_dir . 'dein_lazy_filetype.toml'
let s:leader_lazy_toml_path = s:toml_dir . 'dein_lazy_leader.toml'

if dein#load_state(s:base_path)
  let g:dein#cache_directory = expand('~/.cache/dein')
  call dein#begin(s:base_path)
  call dein#load_toml(s:toml_path, {'lazy': 0})
  call dein#load_toml(s:lazy_toml_path, {'lazy': 1})
  call dein#load_toml(s:filetype_lazy_toml_path, {'lazy': 1})
  call dein#load_toml(s:leader_lazy_toml_path, {'lazy': 1})
  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif
