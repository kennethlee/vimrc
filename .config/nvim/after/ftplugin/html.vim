if &filetype ==# 'html'
  autocmd user_fold BufNewFile,BufRead,BufWinEnter <buffer>
    \   setlocal foldcolumn=1
    \|  setlocal foldmethod=indent
    \|  setlocal foldnestmax=5
  setlocal foldlevel=2

  if executable('prettier')
    setlocal formatprg=prettier\ --stdin-filepath\ %
    " autocmd user_lint BufWritePre <buffer> normal gggqG
  endif
endif

