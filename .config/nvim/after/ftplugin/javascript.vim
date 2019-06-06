if &filetype ==# 'javascript'
  setlocal colorcolumn=81

  if executable('eslint')
    setlocal errorformat=%f:\ line\ %l\\,\ col\ %c\\,\ %m,%-G%.%#
    setlocal makeprg=eslint\ --format\ compact
    " autocmd user_lint BufWritePost <buffer> silent lmake! <afile> | silent redraw!
  endif

  if executable('prettier')
    setlocal formatprg=prettier\ --stdin-filepath\ %\ --trailing-comma\ all
    " autocmd user_lint BufWritePre <buffer> :normal gggqG
  endif
endif

