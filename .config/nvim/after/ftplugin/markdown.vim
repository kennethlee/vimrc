let b:did_ftplugin = 1

" folding
setlocal foldenable
setlocal foldmethod=expr
setlocal foldexpr=MarkdownLevel()
setlocal foldlevel=0
setlocal foldnestmax=6
setlocal foldcolumn=0

" fold at '#'
function! MarkdownLevel() abort
  let h = matchstr(getline(v:lnum), '^#\+')
  if empty(h)
    return "="
  else
    return ">" . len(h)
  endif
endfunction

" misc
setlocal syn=off

