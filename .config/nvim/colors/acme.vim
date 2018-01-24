" adapted from: https://github.com/plan9-for-vimspace/acme-colors

" for cterm, 'black' might get overwritten by the terminal emulator,
" so we use 232 (#080808), which is close enough.

highlight clear

highlight! Normal       guibg=#ffffaf   guifg=#080808   gui=none    ctermbg=329   ctermfg=232   cterm=none
highlight! NonText      guibg=none      guifg=#af8700   gui=none    ctermbg=none  ctermfg=136   cterm=none
highlight! StatusLine   guibg=#aeeeee   guifg=fg        gui=none    ctermbg=159   ctermfg=fg    cterm=none
highlight! StatusLineNC guibg=#d7ffd7   guifg=#6c6c6c   gui=none    ctermbg=193   ctermfg=242   cterm=none
highlight! WildMenu     guibg=#ffd787   guifg=fg        gui=none    ctermbg=fg    ctermfg=159   cterm=none
highlight! VertSplit    guibg=none      guifg=fg        gui=bold    ctermbg=none  ctermfg=fg    cterm=bold
highlight! Folded       guibg=none      guifg=#585858   gui=italic  ctermbg=none  ctermfg=240   cterm=italic
highlight! FoldColumn   guibg=none      guifg=fg        gui=none    ctermbg=none  ctermfg=fg    cterm=none
highlight! Conceal      guibg=none      guifg=fg        gui=none    ctermbg=none  ctermfg=fg    cterm=none
highlight! LineNr       guibg=none      guifg=#505050   gui=none    ctermbg=none  ctermfg=239   cterm=none
highlight! Visual       guibg=#ffd787   guifg=none      gui=none    ctermbg=222   ctermfg=fg    cterm=none
highlight! Error        guibg=#ff5f87   guifg=fg        gui=none    ctermbg=204   ctermfg=fg    cterm=none
highlight! WarningMsg   guibg=none      guifg=#ff5f87   gui=none    ctermbg=none  ctermfg=204   cterm=none

highlight! Statement    guibg=none      guifg=fg        gui=italic  ctermbg=none  ctermfg=fg    cterm=italic  " const, let, etc
highlight! Identifier   guibg=none      guifg=fg        gui=bold    ctermbg=none  ctermfg=fg    cterm=bold    " curly braces
highlight! Type         guibg=none      guifg=fg        gui=bold    ctermbg=none  ctermfg=fg    cterm=bold
highlight! PreProc      guibg=none      guifg=fg        gui=bold    ctermbg=none  ctermfg=fg    cterm=bold
highlight! Constant     guibg=none      guifg=fg        gui=bold    ctermbg=none  ctermfg=fg    cterm=italic  " strings
highlight! Comment      guibg=none      guifg=#303030   gui=italic  ctermbg=none  ctermfg=236   cterm=italic
highlight! Special      guibg=none      guifg=fg        gui=bold    ctermbg=none  ctermfg=fg    cterm=bold
highlight! SpecialKey   guibg=none      guifg=fg        gui=bold    ctermbg=none  ctermfg=fg    cterm=bold
highlight! Directory    guibg=none      guifg=fg        gui=bold    ctermbg=none  ctermfg=fg    cterm=bold

highlight! link         Title           Directory
highlight! link         MoreMsg         Comment

" vim
highlight link vimFunction Identifier

let g:colors_name = "acme"

