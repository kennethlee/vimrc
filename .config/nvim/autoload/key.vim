" Tab {{{1

" GB
function! key#InsertTabWrapper() abort
  let col = col('.') - 1
  if !col
    return "\<Tab>"
  endif
  let char = getline('.')[col - 1]
  if char =~ '\k'
    " There's an identifier before the cursor, so complete the identifier.
    return "\<C-p>"
  else
    return "\<Tab>"
  endif
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" }}}1
