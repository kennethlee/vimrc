if &filetype ==# 'javascript'
  if executable('eslint')
    setlocal errorformat=%f:\ line\ %l\\,\ col\ %c\\,\ %m,%-G%.%#
    setlocal makeprg=eslint\ --format\ compact

    " lint / format on save
    " autocmd vimrc_lint BufWritePost <buffer> silent lmake! <afile> | silent redraw!
  endif

  if executable('prettier')
    setlocal formatprg=prettier\ --stdin-filepath\ %\ --trailing-comma\ all
    " autocmd vimrc_lint BufWritePre <buffer> :normal gggqG
  endif

  setlocal colorcolumn=81
endif

