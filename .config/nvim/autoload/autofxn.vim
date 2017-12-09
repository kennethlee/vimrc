" markdown folding {{{1

" fold at '#'
function! autofxn#MarkdownLevel() abort
  let h = matchstr(getline(v:lnum), '^#\+')
  if empty(h)
    return "="
  else
    return ">" . len(h)
  endif
endfunction

"===============================================================================
" gb's rename file {{{1

function! autofxn#RenameFile() abort
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'), 'file')

  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' . old_name
    redraw!
  endif
endfunction

"===============================================================================
" }}}1

