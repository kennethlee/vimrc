if &filetype ==# 'qf'
  setlocal bufhidden=wipe
  setlocal nobuflisted
endif

" automatically close corresponding loclist when quitting its parent window
autocmd user_quickfix QuitPre *
  \   if &filetype != 'qf'
  \|    silent! lclose
  \|  endif

