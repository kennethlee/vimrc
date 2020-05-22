" NextIndent {{{1

" jump to previous / next line with same indentation level as current line
function! textobject#NextIndent(exclusive, fwd, lower_level, skip_blanks) abort
  let l:line = line('.')
  let l:column = col('.')
  let l:last_line = line('$')
  let l:indent = indent(line)
  let l:step_value = a:fwd ? 1 : -1

  while (l:line > 0 && l:line <= l:last_line)
    let l:line = l:line + l:step_value
    if (! a:lower_level && indent(l:line) ==# l:indent ||
          \ a:lower_level && indent(l:line) < l:indent)
      if (! a:skip_blanks || strlen(getline(l:line)) > 0)
        if (a:exclusive)
          let l:line = l:line - l:step_value
        endif
        execute l:line
        execute "normal " column . "|"
        return
      endif
    endif
  endwhile
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" }}}1
