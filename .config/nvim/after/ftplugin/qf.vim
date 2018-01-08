setlocal statusline=%#question#
setlocal statusline+=%t
setlocal statusline+=%*
setlocal statusline+=%{exists('w:quickfix_title')?\ '\ '.w:quickfix_title\ :\ ''}\ %=%-15(%l,%c%V%)\ %P

" open quickfix window in full-width vsplit
autocmd BufWinEnter <buffer> wincmd J

