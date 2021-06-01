if &filetype ==# 'lua'
  autocmd User_Fold BufNewFile,BufRead,BufWinEnter <buffer>
    \   setlocal foldcolumn=1
    \|  setlocal foldmethod=marker
  setlocal colorcolumn=120
  setlocal expandtab
  " setlocal omnifunc=v:lua.vim.lsp.omnifunc
  setlocal shiftwidth=2
  setlocal softtabstop=2
  setlocal tabstop=2
endif
