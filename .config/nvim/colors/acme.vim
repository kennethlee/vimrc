" adapted from: https://github.com/plan9-for-vimspace/acme-colors

" for cterm, 'black' might get overwritten by the terminal emulator,
" so we use 232 (#080808), which is close enough.

" black:        #080808   232 (Normal)
" blue:         #afd7d7   152 (StatusLine)
" blue, dark:   #5fafaf    73
" green, light: #d7ffaf   193 (StatusLineNC bg)
" gray:         #6c6c6c   242 (Comment, Folded, FoldColumn, LineNr, NonText, StatusLineNC text)
" orange:       #ffd787   222 (Visual)
" purple:       #8787d7   104
" red, dark:    #ff5f87   204 (Error, WarningMsg)
" red, light:   #ffd7af   223 (Colorcolumn)
" yellow, acme: #ffffaf   229 (Normal)
" yellow, sys:  #ffff00    11 (WildMenu)

highlight clear

highlight! Normal       guibg=#ffffaf   guifg=#080808   gui=none    ctermbg=229   ctermfg=232   cterm=none
highlight! NonText      guibg=none      guifg=#6c6c6c   gui=none    ctermbg=none  ctermfg=242   cterm=none
highlight! StatusLine   guibg=#afd7d7   guifg=fg        gui=none    ctermbg=152   ctermfg=fg    cterm=none
highlight! StatusLineNC guibg=#d7ffaf   guifg=#6c6c6c   gui=none    ctermbg=193   ctermfg=242   cterm=none
" highlight! WildMenu     guibg=#ffd787   guifg=fg        gui=none    ctermbg=222   ctermfg=fg    cterm=none
highlight! VertSplit    guibg=none      guifg=fg        gui=bold    ctermbg=none  ctermfg=fg    cterm=bold
highlight! Folded       guibg=none      guifg=#6c6c6c   gui=italic  ctermbg=none  ctermfg=242   cterm=italic
highlight! FoldColumn   guibg=none      guifg=#6c6c6c   gui=none    ctermbg=none  ctermfg=242   cterm=none
highlight! Conceal      guibg=none      guifg=fg        gui=none    ctermbg=none  ctermfg=fg    cterm=none
highlight! LineNr       guibg=none      guifg=#6c6c6c   gui=none    ctermbg=none  ctermfg=242   cterm=none
highlight! Visual       guibg=#ffd787   guifg=none      gui=none    ctermbg=222   ctermfg=fg    cterm=none
highlight! CursorLine   guibg=#eeeeee   guifg=fg        ctermbg=255 ctermfg=fg
highlight! Error        guibg=#ff5f87   guifg=fg        gui=none    ctermbg=204   ctermfg=fg    cterm=none
highlight! WarningMsg   guibg=none      guifg=#ff5f87   gui=none    ctermbg=none  ctermfg=204   cterm=none
highlight! ColorColumn  guibg=#ffd7af   guifg=none      gui=none    ctermbg=223   ctermfg=none  cterm=none

highlight! Statement    guibg=none      guifg=fg        gui=italic  ctermbg=none  ctermfg=fg    cterm=italic  " const
highlight! Identifier   guibg=none      guifg=fg        gui=bold    ctermbg=none  ctermfg=fg    cterm=bold    " curly braces
highlight! Type         guibg=none      guifg=fg        gui=bold    ctermbg=none  ctermfg=fg    cterm=bold
highlight! PreProc      guibg=none      guifg=fg        gui=bold    ctermbg=none  ctermfg=fg    cterm=bold
highlight! Constant     guibg=none      guifg=fg        gui=bold    ctermbg=none  ctermfg=fg    cterm=italic
highlight! Comment      guibg=none      guifg=#6c6c6c   gui=italic  ctermbg=none  ctermfg=242   cterm=italic
highlight! Special      guibg=none      guifg=fg        gui=bold    ctermbg=none  ctermfg=fg    cterm=bold
highlight! SpecialKey   guibg=none      guifg=fg        gui=bold    ctermbg=none  ctermfg=fg    cterm=bold
highlight! Directory    guibg=none      guifg=fg        gui=bold    ctermbg=none  ctermfg=fg    cterm=bold

" highlight  DiffAdd      guibg=none      guifg=#5fafaf   gui=none    ctermbg=none  ctermfg=73    cterm=none
" highlight  DiffChange   guibg=none      guifg=#8787d7   gui=none    ctermbg=none  ctermfg=104   cterm=none
" highlight  DiffDelete   guibg=none      guifg=#ff5f87   gui=none    ctermbg=none  ctermfg=204   cterm=none
" highlight  DiffText     guibg=none      guifg=#8787d7   gui=none    ctermbg=none  ctermfg=104   cterm=none

highlight! link         Title           Directory
highlight! link         MoreMsg         Comment

" vim
highlight link vimFunction Identifier

let g:colors_name = "acme"

