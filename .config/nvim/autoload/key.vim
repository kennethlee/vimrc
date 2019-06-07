" InsertTabWrapper {{{1

function! key#InsertTabWrapper() abort
  let l:col = col('.') - 1
  if !l:col || getline('.')[l:col - 1] !~ '\k'
    return "\<Tab>"
  else
    return "\<C-p>"
  endif
endfunction

" ==============================================================================
" }}}1

