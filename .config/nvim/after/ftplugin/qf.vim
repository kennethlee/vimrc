" " statusline
" setlocal statusline=%#question#
" setlocal statusline+=%t
" setlocal statusline+=%*
" setlocal statusline+=%{exists('w:quickfix_title')?\ '\ '.w:quickfix_title\ :\ ''}\ %=%-15(%l,%c%V%)\ %P

" " qf window is 1/3 height of current window
" let &l:winheight = &lines / 3

" " open qf window in full-width split
" augroup window_width_quickfix
"   autocmd!
"   autocmd BufWinEnter <buffer> wincmd J
" augroup END

