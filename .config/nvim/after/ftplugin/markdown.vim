let b:did_ftplugin = 1

" folding
setlocal foldenable
setlocal foldmethod=expr
setlocal foldexpr=MarkdownLevel()
setlocal foldlevel=0
setlocal foldcolumn=0

" misc
setlocal syn=off

function! MarkdownLevel() abort
  let currentline = getline(v:lnum)

  if match(currentline, '^#\{1,6}\s') >= 0
    let header_level = strlen(substitute(currentline, '^\(#\{1,6}\).*', '\1', ''))
    return '>' . header_level
  endif

  return '='
endfunction

