" SmartTab {{{1

" function! key#SmartTab() abort
"   let l:line = getline('.')
"   let l:substr = strpart(line, -1, col('.'))
"   let l:substr = matchstr(substr, "[^ \t]*$")
"   if (strlen(substr) ==# 0)
"     return "\<Tab>"
"   endif
"   let l:has_period = match(substr, '\.') !=# -1
"   let l:has_slash = match(substr, '\/') !=# -1
"   if (!has_period && !has_slash)
"     return "\<C-x>\<C-n>"
"   elseif (has_slash)
"     return "\<C-x>\<C-f>"
"   else
"     return "\<C-x>\<C-o>"
"   endif
" endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" }}}1
