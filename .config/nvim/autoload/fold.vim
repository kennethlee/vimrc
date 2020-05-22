" HeaderText {{{1

function! fold#HeaderText() abort
  let l:end_chars = repeat(' ', winwidth(0))
  return getline(v:foldstart).l:end_chars
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" }}}1
