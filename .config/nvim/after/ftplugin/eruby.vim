augroup filetype_eruby
  autocmd!
  au BufRead,BufNewFile *.erb set filetype=eruby
augroup END

" folding
setlocal foldenable
setlocal foldmethod=indent
setlocal foldlevel=2
setlocal foldnestmax=6
setlocal foldcolumn=0
" tabbing
setlocal softtabstop=2
setlocal shiftwidth=2
setlocal autoindent
setlocal expandtab
" misc
setlocal breakindent

