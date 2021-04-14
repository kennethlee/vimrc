if &filetype ==# 'javascript'
  setlocal colorcolumn=81
  setlocal expandtab
  setlocal omnifunc=v:lua.vim.lsp.omnifunc
  setlocal shiftwidth=2
  setlocal softtabstop=2
  setlocal tabstop=2

  if executable('eslint_d')
    compiler eslint
  endif

  if executable('prettier')
    setlocal formatprg=npx\ prettier\ --stdin-filepath\ %\ --trailing-comma\ all
    " autocmd user_lint BufWritePre <buffer> normal gggqG
  endif
endif
