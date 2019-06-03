if &filetype ==# 'json'
  autocmd vimrc_fold BufNewFile,BufRead,BufWinEnter <buffer>
    \   setlocal foldcolumn=1
    \|  setlocal foldmethod=indent
    \|  setlocal foldnestmax=4
  setlocal foldlevel=1

  if executable('eslint')
    setlocal errorformat=%f:\ line\ %l\\,\ col\ %c\\,\ %m,%-G%.%#
    setlocal makeprg=eslint\ --format\ compact
    " autocmd vimrc_lint BufWritePost <buffer> silent lmake! <afile> | silent redraw!
  endif

  if executable('prettier')
    setlocal formatprg=prettier\ --stdin-filepath\ %
    " autocmd vimrc_lint BufWritePre <buffer> :normal gggqG
  endif
endif

