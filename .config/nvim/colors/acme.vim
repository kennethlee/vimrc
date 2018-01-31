" colors {{{1

" adapted from: https://github.com/plan9-for-vimspace/acme-colors

" for cterm, 'black' might get overwritten by the terminal emulator,
" so we use 232 (#080808), which is close enough.

" normal
" black         #080808   232 (Normal fg)
" red           #ff5f87   204 (Error, WarningMsg)
" green         #87d787   114
" yellow (acme) #ffffaf   229 (Normal bg)
" blue          #5fafff    75
" magenta       #d7afff   183
" cyan          #5fafaf    73
" white         #949494   246

" bright
" black         #6c6c6c   242 (Comment fg, Folded fg, FoldColumn fg, LineNr, NonText fg, StatusLineNC fg)
" red           #ffd787   222 (CursorColumn bg, Visual)
" green         #d7ffaf   193 (StatusLineNC bg)
" yellow (sys)  #ffff00    11 (WildMenu bg)
" blue          #5fd7ff    81
" magenta       #d7d7ff   242
" cyan          #afd7d7   152 (StatusLine bg)
" white         #949494   246

" ======================================================================================================================
" highlight groups {{{1

highlight clear

highlight! Normal       guibg=#ffffaf   guifg=#080808   gui=none        ctermbg=229     ctermfg=232     cterm=none
highlight! NonText      guibg=none      guifg=#6c6c6c   gui=none        ctermbg=none    ctermfg=242     cterm=none
highlight! Conceal      guibg=none      guifg=fg        gui=none        ctermbg=none    ctermfg=fg      cterm=none
highlight! StatusLine   guibg=#afd7d7   guifg=fg        gui=none        ctermbg=152     ctermfg=fg      cterm=none
highlight! StatusLineNC guibg=#d7ffaf   guifg=#6c6c6c   gui=none        ctermbg=193     ctermfg=242     cterm=none
highlight! LineNr       guibg=none      guifg=#6c6c6c   gui=none        ctermbg=none    ctermfg=242     cterm=none
highlight! VertSplit    guibg=none      guifg=fg        gui=bold        ctermbg=none    ctermfg=fg      cterm=bold
highlight! Visual       guibg=#ffd787   guifg=none      gui=none        ctermbg=222     ctermfg=fg      cterm=none
highlight! WildMenu     guibg=#ffd787   guifg=fg        gui=bold        ctermbg=222     ctermfg=fg      cterm=bold
highlight! Directory    guibg=none      guifg=fg        gui=bold        ctermbg=none    ctermfg=fg      cterm=bold
highlight! Folded       guibg=none      guifg=#6c6c6c   gui=italic      ctermbg=none    ctermfg=242     cterm=italic
highlight! FoldColumn   guibg=none      guifg=#6c6c6c   gui=none        ctermbg=none    ctermfg=242     cterm=none
highlight! ColorColumn  guibg=#ffd787   guifg=none      gui=none        ctermbg=222     ctermfg=none    cterm=none
highlight! CursorLine   guibg=#eeeeee   guifg=fg        gui=none        ctermbg=255     ctermfg=fg      cterm=none
highlight! Error        guibg=#ff5f87   guifg=fg        gui=none        ctermbg=204     ctermfg=fg      cterm=none
highlight! WarningMsg   guibg=none      guifg=#ff5f87   gui=none        ctermbg=none    ctermfg=204     cterm=none
highlight! SpecialKey   guibg=none      guifg=fg        gui=none        ctermbg=none    ctermfg=fg      cterm=none

highlight! link         Title           Directory
highlight! link         MoreMsg         Comment

" ======================================================================================================================
" syntax groups {{{1

highlight! Comment          guibg=none      guifg=#6c6c6c   gui=italic      ctermbg=none    ctermfg=242     cterm=italic

highlight! Constant         guibg=none      guifg=fg        gui=bold        ctermbg=none    ctermfg=fg      cterm=bold
highlight! String           guibg=none      guifg=fg        gui=none        ctermbg=none    ctermfg=fg      cterm=none
" highlight! Character        guibg=none      guifg=fg        gui=none        ctermbg=none    ctermfg=fg      cterm=none
" highlight! Number           guibg=none      guifg=fg        gui=none        ctermbg=none    ctermfg=fg      cterm=none
highlight! Boolean          guibg=none      guifg=fg        gui=italic      ctermbg=none    ctermfg=fg      cterm=italic
" highlight! Float            guibg=none      guifg=fg        gui=none        ctermbg=none    ctermfg=fg      cterm=none

highlight! Identifier       guibg=none      guifg=fg        gui=italic      ctermbg=none    ctermfg=fg      cterm=italic
highlight! Function         guibg=none      guifg=fg        gui=bold        ctermbg=none    ctermfg=fg      cterm=bold

highlight! Statement        guibg=none      guifg=fg        gui=bold        ctermbg=none    ctermfg=fg      cterm=bold
highlight! Conditional      guibg=none      guifg=fg        gui=italic      ctermbg=none    ctermfg=fg      cterm=italic
highlight! Repeat           guibg=none      guifg=fg        gui=italic      ctermbg=none    ctermfg=fg      cterm=italic
highlight! Label            guibg=none      guifg=fg        gui=none        ctermbg=none    ctermfg=fg      cterm=none
" highlight! Operator         guibg=none      guifg=fg        gui=none        ctermbg=none    ctermfg=fg      cterm=none
highlight! Keyword          guibg=none      guifg=fg        gui=bold        ctermbg=none    ctermfg=fg      cterm=bold
" highlight! Exception        guibg=none      guifg=fg        gui=none        ctermbg=none    ctermfg=fg      cterm=none

highlight! PreProc          guibg=none      guifg=fg        gui=bold        ctermbg=none    ctermfg=fg      cterm=bold
" highlight! Include          guibg=none      guifg=fg        gui=none        ctermbg=none    ctermfg=fg      cterm=none
" highlight! Define           guibg=none      guifg=fg        gui=none        ctermbg=none    ctermfg=fg      cterm=none
" highlight! Macro            guibg=none      guifg=fg        gui=none        ctermbg=none    ctermfg=fg      cterm=none
" highlight! PreCondit        guibg=none      guifg=fg        gui=none        ctermbg=none    ctermfg=fg      cterm=none

highlight! Type             guibg=none      guifg=fg        gui=bold        ctermbg=none    ctermfg=fg      cterm=bold
" highlight! StorageClass     guibg=none      guifg=fg        gui=none        ctermbg=none    ctermfg=fg      cterm=none
" highlight! Structure        guibg=none      guifg=fg        gui=none        ctermbg=none    ctermfg=fg      cterm=none
" highlight! Typedef          guibg=none      guifg=fg        gui=none        ctermbg=none    ctermfg=fg      cterm=none

highlight! Special          guibg=none      guifg=fg        gui=none        ctermbg=none    ctermfg=fg      cterm=none
" highlight! SpecialChar      guibg=none      guifg=fg        gui=none        ctermbg=none    ctermfg=fg      cterm=none
" highlight! Tag              guibg=none      guifg=fg        gui=none        ctermbg=none    ctermfg=fg      cterm=none
" highlight! Delimiter        guibg=none      guifg=fg        gui=none        ctermbg=none    ctermfg=fg      cterm=none
" highlight! SpecialComment   guibg=none      guifg=fg        gui=none        ctermbg=none    ctermfg=fg      cterm=none
" highlight! Debug            guibg=none      guifg=fg        gui=none        ctermbg=none    ctermfg=fg      cterm=none

" highlight! Underlined       guibg=none      guifg=fg        gui=none        ctermbg=none    ctermfg=fg      cterm=none
" highlight! Ignore           guibg=none      guifg=fg        gui=none        ctermbg=none    ctermfg=fg      cterm=none
" highlight! Error            guibg=none      guifg=fg        gui=none        ctermbg=none    ctermfg=fg      cterm=none
" highlight! Todo             guibg=none      guifg=fg        gui=none        ctermbg=none    ctermfg=fg      cterm=none

" ======================================================================================================================
" diff {{{1

" highlight  DiffAdd          guibg=none      guifg=#5fafaf   gui=none        ctermbg=none    ctermfg=73      cterm=none
" highlight  DiffChange       guibg=none      guifg=#8787d7   gui=none        ctermbg=none    ctermfg=104     cterm=none
" highlight  DiffDelete       guibg=none      guifg=#ff5f87   gui=none        ctermbg=none    ctermfg=204     cterm=none
" highlight  DiffText         guibg=none      guifg=#8787d7   gui=none        ctermbg=none    ctermfg=104     cterm=none

" ======================================================================================================================
" }}}1

" vim
highlight link vimFunction Identifier

let g:colors_name = "acme"

