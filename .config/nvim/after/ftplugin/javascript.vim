if &filetype ==# 'javascript'
  setlocal colorcolumn=81
  setlocal expandtab
  " an autocmd now handles attachment of omnifunc once LSP server is
  " initialized. see lua/lsp/custom.lua
  " setlocal omnifunc=v:lua.vim.lsp.omnifunc
  setlocal shiftwidth=2
  setlocal softtabstop=2
  setlocal tabstop=2

  " currently not in use. use <Space>gl to populate the loclist via LSP instead.
  if executable('eslint_d')
    compiler eslint
  endif

  " currently not in use, but the gq operator is still functioning via LSP
  if executable('prettier')
    setlocal formatprg=npx\ prettier\ --stdin-filepath\ %\ --trailing-comma\ all
    " format buffer before write.
    " autocmd User_Lint BufWritePre <buffer> normal gggqG
  endif
endif
