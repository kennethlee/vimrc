setlocal statusline=%#question#
setlocal statusline+=%t
setlocal statusline+=%*
setlocal statusline+=%{exists('w:quickfix_title')?\ '\ '.w:quickfix_title\ :\ ''}\ %=%-15(%l,%c%V%)\ %P

