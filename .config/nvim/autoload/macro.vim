" ChangeRegister {{{1

function! macro#ChangeRegister() abort
  let x = nr2char(getchar())
  call feedkeys("q:ilet @" . x . " = \<C-r>\<C-r>=string(@" . x . ")\<CR>\<Esc>0f'", 'n')
endfunction

" ==============================================================================
" }}}1

