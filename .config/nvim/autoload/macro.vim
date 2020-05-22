" ChangeRegister {{{1

function! macro#ChangeRegister() abort
  let l:x = nr2char(getchar())
  call feedkeys("q:ilet @" . l:x . " = \<C-r>\<C-r>=string(@" . l:x . ")\<CR>\<Esc>0f'", 'n')
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" }}}1
