if &filetype ==# 'css'
  autocmd user_fold BufNewFile,BufRead,BufWinEnter <buffer>
    \   setlocal foldcolumn=1
    \|  setlocal foldmethod=indent
    \|  setlocal foldnestmax=4

  if executable('prettier')
    setlocal formatprg=prettier\ --stdin-filepath\ %
    " autocmd user_lint BufWritePre <buffer> :normal gggqG
  endif
endif

