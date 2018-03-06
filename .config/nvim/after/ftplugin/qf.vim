" buffer {{{1

" are we in a location list or a quickfix list?
" used by :Keep, :Reject, :Restore
let b:qf_isLoc = !empty(getloclist(0))

setlocal nobuflisted bufhidden=wipe

" ==============================================================================
" window {{{1

" qf window is 1/2 height of current window
let &l:winheight = &lines / 2

augroup settings_quickfix
  autocmd!
  autocmd BufEnter <buffer> if get(g:, 'qf_auto_quit', 1) | if winnr('$') < 2 | q | endif | endif
  " open qf window in full-width split
  autocmd BufWinEnter <buffer> wincmd J
  autocmd BufWinEnter <buffer> if get(g:, 'qf_auto_quit', 1) | call qf#ReuseTitle() | endif
  " automatically close corresponding loclist when quitting a window
  if exists('##QuitPre')
    autocmd QuitPre * if &filetype != 'qf' | silent! lclose | endif
  endif
augroup END

" ==============================================================================
" commands {{{1

command! -buffer -nargs=? Keep call qf#FilterList(<q-args>, 0)
command! -buffer -nargs=? Reject call qf#FilterList(<q-args>, 1)
command! -buffer -bar Restore call qf#RestoreList()

" ==============================================================================
" }}}1

