setlocal statusline=%#question#
setlocal statusline+=%t
setlocal statusline+=%*
setlocal statusline+=%{exists('w:quickfix_title')?\ '\ '.w:quickfix_title\ :\ ''}\ %=%-15(%l,%c%V%)\ %P

" qf window is 1/3 height of current window
let &l:winheight = &lines / 3

" open quickfix window in full-width vsplit
autocmd BufWinEnter <buffer> wincmd J

