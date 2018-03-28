" HeaderText {{{1

function! fold#HeaderText() abort
  let end_chars = repeat(' ', winwidth(0))
  return getline(v:foldstart).end_chars
endfunction

" ==============================================================================
" MarkdownLevel {{{1

function! fold#MarkdownLevel() abort
  let currentline = getline(v:lnum)
  if match(currentline, '^#\{1,6}\s') >= 0
    let header_level = strlen(substitute(currentline, '^\(#\{1,6}\).*', '\1', ''))
    return '>' . header_level
  endif
  return '='
endfunction

" ==============================================================================
" }}}1

