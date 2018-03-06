" buffer {{{1

" are we in a location list or a quickfix list?
" used by :Keep, :Reject, :Restore
let b:qf_isLoc = !empty(getloclist(0))

setlocal nobuflisted bufhidden=wipe

" ==============================================================================
" window {{{1

" qf window is 1/2 height of current window
let &l:winheight = &lines / 2

" open qf window in full-width split
augroup window_width_quickfix
  autocmd!
  autocmd BufWinEnter <buffer> wincmd J
augroup END

" ==============================================================================
" commands {{{1

command! -buffer -nargs=? Keep call qf#FilterList(<q-args>, 0)
command! -buffer -nargs=? Reject call qf#FilterList(<q-args>, 1)
command! -buffer -bar Restore call qf#RestoreList()

" ==============================================================================
" }}}1

