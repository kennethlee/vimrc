" HeaderText {{{1

function! fold#HeaderText() abort
  let end_chars = repeat(' ', winwidth(0))
  return getline(v:foldstart).end_chars
endfunction

" ==============================================================================
" }}}1

