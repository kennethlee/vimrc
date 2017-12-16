" folding
setlocal foldenable
setlocal foldmethod=indent
setlocal foldlevel=0
setlocal foldnestmax=2
setlocal foldcolumn=0

" misc
setlocal colorcolumn=81

" `:make! %` to lint current buffer
" `:make! *.js` to lint all javascript files
if executable('eslint')
  setlocal errorformat=%f:\ line\ %l\\,\ col\ %c\\,\ %m,%-G%.%#
  setlocal makeprg=eslint\ --format\ compact

  augroup linting_javascript
    autocmd!
    " autocmd BufWritePost <buffer> silent make! <afile> | silent redraw!
  augroup END
endif

