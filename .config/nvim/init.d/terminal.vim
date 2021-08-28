augroup terminal
  autocmd!
  autocmd TermOpen * startinsert
  autocmd TermOpen * :set nonumber norelativenumber
  autocmd TermOpen * nnoremap <buffer> <C-c> i<C-c>
augroup END
