let b:did_ftplugin = 1

" fold {{{1

setlocal foldenable
setlocal foldmethod=expr
setlocal foldtext=fold#HeaderText()
setlocal foldexpr=MarkdownLevel()
setlocal foldlevel=0
setlocal foldnestmax=6
setlocal foldcolumn=1

function! MarkdownLevel() abort
  let currentline = getline(v:lnum)
  if match(currentline, '^#\{1,6}\s') >= 0
    let header_level = strlen(substitute(currentline, '^\(#\{1,6}\).*', '\1', ''))
    return '>' . header_level
  endif
  return '='
endfunction

" ==============================================================================
" misc {{{1

setlocal syn=off

" ==============================================================================
" }}}1

