" Tab {{{1

function! key#InsertTabWrapper() abort
  let line = getline(".")
  let substr = strpart(line, -1, col("."))
  let substr = matchstr(substr, "[^ \t]*$")
  let lsp = "v:lua.vim.lsp.omnifunc"

  if (strlen(substr) == 0)
    return "\<Tab>"
  endif

  if pumvisible() || (&omnifunc != lsp)
    return "\<C-n>"
  endif

  if (&omnifunc == lsp)
    return "\<C-x>\<C-o>"
  endif
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" }}}1
