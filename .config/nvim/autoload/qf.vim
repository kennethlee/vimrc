" LocListToggle / QuickfixToggle {{{1

function! qf#LocListToggle() abort
  let l:callback = "v:val.quickfix == 1 && v:val.loclist == 1"
  execute len(filter(getwininfo(), l:callback)) == 1 ? "lclose" : "lwindow"
endfunction

function! qf#QuickfixToggle() abort
  let l:callback = "v:val.quickfix == 1 && v:val.loclist == 0"
  " botright cwindow sets the qf window to be full-width
  execute len(filter(getwininfo(), l:callback)) == 1 ? "cclose" : "botright cwindow"
endfunction

" ==============================================================================
" }}}1

