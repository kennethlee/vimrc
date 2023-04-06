" Tab {{{1

function! key#InsertTabWrapper() abort
  if (&omnifunc != "v:lua.vim.lsp.omnifunc")
    return "\<Tab>"
  endif
  if pumvisible()
    return "\<C-n>"
  endif

  let line = getline(".")                         " current line
  let substr = strpart(line, -1, col(".") + 1)    " from the start of the current
  let substr = matchstr(substr, "[^ \t]*$")       " word till cursor
  if (strlen(substr) == 0)                        " nothing to match on empty string
    return "\<Tab>"
  elseif exists("&omnifunc") && &omnifunc != ""
    return "\<C-x>\<C-o>"
  else
    return "\<C-n>"
  endif
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" }}}1
