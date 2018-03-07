" buffer {{{1

" are we in a location list or a quickfix list?
" used by :Keep, :Reject, :Restore
let b:qf_isLoc = !empty(getloclist(0))

setlocal nobuflisted bufhidden=wipe

" ==============================================================================
" commands {{{1

command! -buffer -nargs=? Keep call qf#FilterList(<q-args>, 0)
command! -buffer -nargs=? Reject call qf#FilterList(<q-args>, 1)
command! -buffer -bar Restore call qf#RestoreList()

" ==============================================================================
" window {{{1

autocmd settings_quickfix BufEnter <buffer> if get(g:, 'qf_auto_quit', 1) | if winnr('$') < 2 | q | endif | endif
autocmd settings_quickfix BufWinEnter <buffer> if get(g:, 'qf_auto_quit', 1) | call qf#ReuseTitle() | endif

" ==============================================================================
" }}}1

