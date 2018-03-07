" misc {{{1

setlocal colorcolumn=81

if executable('eslint')
  setlocal errorformat=%f:\ line\ %l\\,\ col\ %c\\,\ %m,%-G%.%#
  setlocal makeprg=eslint\ --format\ compact
endif

" ==============================================================================
" }}}1

