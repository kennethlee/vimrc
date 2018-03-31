if &filetype ==# 'vim'
  autocmd vimrc_fold BufNewFile,BufRead,BufWinEnter <buffer>
    \   setlocal foldcolumn=1
    \|  setlocal foldmethod=marker
endif

