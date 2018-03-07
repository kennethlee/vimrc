" TerminalToggle {{{1

let s:term_buf = 0
let s:term_win = 0

function! window#TerminalToggle() abort
  if win_gotoid(s:term_win)
    hide
  else
    botright new
    exec "resize " . &lines / 2
    setlocal nobuflisted bufhidden=wipe
    try
      exec "buffer " . s:term_buf
    catch
      call termopen($SHELL, {"detach": 0})
      let s:term_buf = bufnr("")
    endtry
    let s:term_win = win_getid()
  endif
endfunction

" ==============================================================================
" }}}1

