" LocListToggle {{{1

function! window#LocListToggle() abort
  let l:callback = "v:val.quickfix ==# 1 && v:val.loclist ==# 1"
  execute len(filter(getwininfo(), l:callback)) ==# 1 ? "lclose" : "lwindow"
endfunction

" ==============================================================================
" QuickfixToggle {{{1

function! window#QuickfixToggle() abort
  let l:callback = "v:val.quickfix ==# 1 && v:val.loclist ==# 0"
  " botright cwindow sets the qf window to be full-width
  execute len(filter(getwininfo(), l:callback)) ==# 1 ? "cclose" : "botright cwindow"
endfunction

" ==============================================================================
" TerminalToggle {{{1

let s:term_buf = 0
let s:term_win = 0

function! window#TerminalToggle() abort
  if win_gotoid(s:term_win)
    hide
  else
    botright new
    execute "resize " . &lines / 2
    setlocal nobuflisted bufhidden=wipe
    try
      execute "buffer " . s:term_buf
    catch
      call termopen($SHELL, {"detach": 0})
      let s:term_buf = bufnr("")
    endtry
    let s:term_win = win_getid()
  endif
endfunction

" ==============================================================================
" }}}1

