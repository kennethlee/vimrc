if &filetype ==# 'ledger'
  autocmd Fold BufNewFile,BufRead,BufWinEnter <buffer>
    \   setlocal foldmethod=marker
  " commentstring for vim-commentary
  setlocal commentstring=;\ %s
  setlocal expandtab
  setlocal shiftwidth=4
  setlocal softtabstop=4
  setlocal tabstop=4
endif
