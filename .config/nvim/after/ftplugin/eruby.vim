augroup filetype_eruby
  autocmd!
  autocmd BufRead,BufNewFile *.erb set filetype=eruby
augroup END

" folding
setlocal foldenable
setlocal foldmethod=indent
setlocal foldlevel=2
setlocal foldnestmax=6
setlocal foldcolumn=0

" misc
setlocal breakindent

