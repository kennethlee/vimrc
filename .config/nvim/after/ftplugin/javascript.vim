if &filetype ==# 'javascript'
  setlocal colorcolumn=81

  if executable('eslint')
    compiler eslint
  endif

  if executable('prettier')
    setlocal formatprg=prettier\ --stdin-filepath\ %\ --trailing-comma\ all
    " autocmd user_lint BufWritePre <buffer> normal gggqG
  endif
endif

