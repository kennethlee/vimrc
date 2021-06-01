if &filetype ==# 'ledger'
  autocmd User_Fold BufNewFile,BufRead,BufWinEnter <buffer>
    \   setlocal foldmethod=marker
  setlocal commentstring=;\ %s
  setlocal expandtab
  setlocal shiftwidth=4
  setlocal softtabstop=4
  setlocal tabstop=4
endif
