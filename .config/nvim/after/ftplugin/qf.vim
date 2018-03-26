setlocal bufhidden=wipe
setlocal nobuflisted

" are we in a loclist, or a qf list? used by :Keep, :Reject, :Restore
let b:qf_isLoc = !empty(getloclist(0))

" for :Keep, :Reject, :Restore
autocmd vimrc_quickfix BufEnter <buffer> if get(g:, 'qf_auto_quit', 1) | if winnr('$') < 2 | q | endif | endif
autocmd vimrc_quickfix BufWinEnter <buffer> if get(g:, 'qf_auto_quit', 1) | call qf#ReuseTitle() | endif

" commands
command! -buffer -nargs=? Keep call qf#FilterList(<q-args>, 0)
command! -buffer -nargs=? Reject call qf#FilterList(<q-args>, 1)
command! -buffer -bar Restore call qf#RestoreList()
command! Lclear call qf#LocListClear()
command! Cclear call qf#QuickfixClear()

