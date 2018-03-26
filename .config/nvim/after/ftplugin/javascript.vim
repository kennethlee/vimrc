if executable('eslint')
  setlocal errorformat=%f:\ line\ %l\\,\ col\ %c\\,\ %m,%-G%.%#
  setlocal makeprg=eslint\ --format\ compact
endif

" " lint on save
" autocmd vimrc_lint BufWritePost <buffer> silent lmake! <afile> | silent redraw!

setlocal colorcolumn=81

