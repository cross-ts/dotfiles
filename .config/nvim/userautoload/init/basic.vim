" インデントに関する設定
set autoindent
set smartindent

" tab/space設定
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2

" カーソルに関する設定
set number
set cursorline
set whichwrap=b,s,h,l,<,>,[,],~
nnoremap j gj
nnoremap k gk
nnoremap <down> gj
nnoremap <up> gk
nnoremap sh <C-w>h
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sw <C-w>w
nnoremap Y y$
inoremap <silent> jj <ESC>
nnoremap <cr> za
nnoremap ; :

" open new window in right
set splitright

" キー操作に関する設定
set backspace=indent,eol,start

" 検索設定
set incsearch
set ignorecase
set smartcase
set hlsearch

" ファイル名表示・補完
set laststatus=2
set wildmenu
set wildmode=longest,full

" 折りたたみに関する設定
set foldmethod=indent
set foldcolumn=1
autocmd BufRead * normal zR

" 永続undo
set undofile
if !isdirectory(expand("$HOME/.vim/undodir"))
  call mkdir(expand("$HOME/.vim/undodir"))
endif
set undodir=$HOME/.vim/undodir

" ターミナルモードに関する設定
tnoremap <ESC> <C-\><C-n>
