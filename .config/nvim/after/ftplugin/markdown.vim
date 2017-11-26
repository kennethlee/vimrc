" folding at '#' headers
function! MarkdownLevel()
  let h = matchstr(getline(v:lnum), '^#\+')
  if empty(h)
    return "="
  else
    return ">" . len(h)
  endif
endfunction

augroup filetype_markdown
  autocmd!
  autocmd BufRead,BufNewFile *.markdown,*.md,*.mdown,*.mkd,*.mkdn set filetype=markdown
  autocmd BufEnter *.markdown,*.md,*.mdown,*.mkd,*.mkdn setlocal foldexpr=MarkdownLevel()
  autocmd BufEnter *.markdown,*.md,*.mdown,*.mkd,*.mkdn setlocal foldmethod=expr
augroup END

" folding
setlocal foldenable
setlocal foldlevel=0
setlocal foldnestmax=6
setlocal foldcolumn=0

" misc
setlocal syn=off

