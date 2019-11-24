if &filetype ==# 'yaml'
  if executable('prettier')
    setlocal formatprg=prettier\ --stdin-filepath\ %
    " autocmd user_lint BufWritePre <buffer> normal gggqG
  endif
endif

