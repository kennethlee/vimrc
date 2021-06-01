if &filetype ==# 'qf'
  setlocal bufhidden=wipe
  setlocal nobuflisted

  " set <C-h> and <C-l> to Nop in quickfix / loclist buffers
  nnoremap <buffer> <C-h> <Nop>
  nnoremap <buffer> <C-l> <Nop>
endif

" automatically close corresponding loclist when quitting its parent window
autocmd User_Quickfix QuitPre *
  \   if &filetype !=# 'qf'
  \|    silent! lclose
  \|  endif
