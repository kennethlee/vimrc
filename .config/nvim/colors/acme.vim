" colors {{{1

" adapted from: https://github.com/plan9-for-vimspace/acme-colors

" for cterm, 'black' might get overwritten by the terminal emulator,
" so we use 232 (#080808), which is close enough.

" normal
" black         #080808   232
" red           #ff5f87   204
" green         #87d787   114
" yellow        #d7d787   186
" blue          #5fafff    75
" magenta       #d7afff   183
" cyan          #5fafaf    73
" white         #949494   246

" bright
" black         #6c6c6c   242
" red           #ffd787   222
" green         #d7ffaf   193
" yellow (acme) #ffffaf   229
" blue          #5fd7ff    81
" magenta       #d7d7ff   242
" cyan          #afd7d7   152
" white         #949494   246

" ======================================================================================================================
" highlight groups {{{1

hi clear

hi Normal       guibg=#ffffaf   guifg=#080808   gui=none        ctermbg=229   ctermfg=232   cterm=none        " bg: yellow,    fg: black
hi NonText      guibg=none      guifg=#949494   gui=none        ctermbg=none  ctermfg=246   cterm=none        " bg: none,      fg: white
hi Conceal      guibg=none      guifg=fg        gui=none        ctermbg=none  ctermfg=fg    cterm=none        " bg: none,      fg: fg
hi StatusLine   guibg=#afd7d7   guifg=fg        gui=none        ctermbg=152   ctermfg=fg    cterm=none        " bg: l. cyan,   fg: fg
hi StatusLineNC guibg=#d7ffaf   guifg=#6c6c6c   gui=none        ctermbg=193   ctermfg=242   cterm=none        " bg: l. green,  fg: l. black
hi LineNr       guibg=none      guifg=#6c6c6c   gui=none        ctermbg=none  ctermfg=242   cterm=none        " bg: none,      fg: l. black
hi VertSplit    guibg=none      guifg=fg        gui=bold        ctermbg=none  ctermfg=fg    cterm=bold        " bg: none,      fg: fg
hi Visual       guibg=#d7d787   guifg=#080808   gui=none        ctermbg=186   ctermfg=232   cterm=none        " bg: l. yellow, fg: black
hi WildMenu     guibg=#ffd787   guifg=fg        gui=bold        ctermbg=222   ctermfg=fg    cterm=bold        " bg: l. red,    fg: fg
hi Directory    guibg=none      guifg=fg        gui=bold        ctermbg=none  ctermfg=fg    cterm=bold        " bg: none,      fg: fg
hi Folded       guibg=none      guifg=#6c6c6c   gui=italic      ctermbg=none  ctermfg=242   cterm=italic      " bg: none,      fg: l. black
hi FoldColumn   guibg=none      guifg=#6c6c6c   gui=none        ctermbg=none  ctermfg=242   cterm=none        " bg: none,      fg: l. black
hi ColorColumn  guibg=#ffd787   guifg=none      gui=none        ctermbg=222   ctermfg=none  cterm=none        " bg: l. red,    fg: none
hi CursorLine   guibg=#d7d787   guifg=fg        gui=none        ctermbg=186   ctermfg=fg    cterm=none        " bg: white,     fg: none
hi Error        guibg=#ff5f87   guifg=fg        gui=none        ctermbg=204   ctermfg=fg    cterm=none        " bg: red,       fg: fg
hi WarningMsg   guibg=none      guifg=#ff5f87   gui=none        ctermbg=none  ctermfg=204   cterm=none        " bg: none,      fg: red
hi SpecialKey   guibg=none      guifg=fg        gui=none        ctermbg=none  ctermfg=fg    cterm=none        " bg: none,      fg: fg

hi link         Title           Directory
hi link         MoreMsg         Comment

" ======================================================================================================================
" syntax groups {{{1

hi Comment        guibg=none      guifg=#6c6c6c   gui=italic      ctermbg=none  ctermfg=242   cterm=italic

hi Constant       guibg=none      guifg=fg        gui=bold        ctermbg=none  ctermfg=fg    cterm=bold
hi String         guibg=none      guifg=fg        gui=none        ctermbg=none  ctermfg=fg    cterm=none
" hi Character      guibg=none      guifg=fg        gui=none        ctermbg=none  ctermfg=fg    cterm=none
" hi Number         guibg=none      guifg=fg        gui=none        ctermbg=none  ctermfg=fg    cterm=none
hi Boolean        guibg=none      guifg=fg        gui=italic      ctermbg=none  ctermfg=fg    cterm=italic
" hi Float          guibg=none      guifg=fg        gui=none        ctermbg=none  ctermfg=fg    cterm=none

hi Identifier     guibg=none      guifg=fg        gui=italic      ctermbg=none  ctermfg=fg    cterm=italic
hi Function       guibg=none      guifg=fg        gui=bold        ctermbg=none  ctermfg=fg    cterm=bold

hi Statement      guibg=none      guifg=fg        gui=bold        ctermbg=none  ctermfg=fg    cterm=bold
hi Conditional    guibg=none      guifg=fg        gui=italic      ctermbg=none  ctermfg=fg    cterm=italic
hi Repeat         guibg=none      guifg=fg        gui=italic      ctermbg=none  ctermfg=fg    cterm=italic
hi Label          guibg=none      guifg=fg        gui=none        ctermbg=none  ctermfg=fg    cterm=none
" hi Operator       guibg=none      guifg=fg        gui=none        ctermbg=none  ctermfg=fg    cterm=none
hi Keyword        guibg=none      guifg=fg        gui=bold        ctermbg=none  ctermfg=fg    cterm=bold
" hi Exception      guibg=none      guifg=fg        gui=none        ctermbg=none  ctermfg=fg    cterm=none

hi PreProc        guibg=none      guifg=fg        gui=bold        ctermbg=none  ctermfg=fg    cterm=bold
" hi Include        guibg=none      guifg=fg        gui=none        ctermbg=none  ctermfg=fg    cterm=none
" hi Define         guibg=none      guifg=fg        gui=none        ctermbg=none  ctermfg=fg    cterm=none
" hi Macro          guibg=none      guifg=fg        gui=none        ctermbg=none  ctermfg=fg    cterm=none
" hi PreCondit      guibg=none      guifg=fg        gui=none        ctermbg=none  ctermfg=fg    cterm=none

hi Type           guibg=none      guifg=fg        gui=bold        ctermbg=none  ctermfg=fg    cterm=bold
" hi StorageClass   guibg=none      guifg=fg        gui=none        ctermbg=none  ctermfg=fg    cterm=none
" hi Structure      guibg=none      guifg=fg        gui=none        ctermbg=none  ctermfg=fg    cterm=none
" hi Typedef        guibg=none      guifg=fg        gui=none        ctermbg=none  ctermfg=fg    cterm=none

hi Special        guibg=none      guifg=fg        gui=none        ctermbg=none  ctermfg=fg    cterm=none
" hi SpecialChar    guibg=none      guifg=fg        gui=none        ctermbg=none  ctermfg=fg    cterm=none "
" hi Tag            guibg=none      guifg=fg        gui=none        ctermbg=none  ctermfg=fg    cterm=none "
" hi Delimiter      guibg=none      guifg=fg        gui=none        ctermbg=none  ctermfg=fg    cterm=none "
hi SpecialComment guibg=none      guifg=fg        gui=none        ctermbg=none  ctermfg=fg    cterm=none "
" hi Debug          guibg=none      guifg=fg        gui=none        ctermbg=none  ctermfg=fg    cterm=none

" hi Underlined     guibg=none      guifg=fg        gui=none        ctermbg=none  ctermfg=fg    cterm=none
" hi Ignore         guibg=none      guifg=fg        gui=none        ctermbg=none  ctermfg=fg    cterm=none
" hi Error          guibg=none      guifg=fg        gui=none        ctermbg=none  ctermfg=fg    cterm=none
" hi Todo           guibg=none      guifg=fg        gui=none        ctermbg=none  ctermfg=fg    cterm=none

" ======================================================================================================================
" diff {{{1

" hi DiffAdd    guibg=#87d787   guifg=#949494   gui=bold        ctermbg=114   ctermfg=246   cterm=bold        " bg: green,     fg: white
" hi DiffChange guibg=#080808   guifg=#949494   gui=bold        ctermbg=232   ctermfg=246   cterm=bold        " black bg,      fg: white
" hi DiffDelete guibg=#5fd7ff   guifg=#5fafff   gui=none        ctermbg=81    ctermfg=75    cterm=none        " dark blue bg,  fg: blue
" hi DiffText   guibg=#ff5f87   guifg=#ffffaf   gui=bold        ctermbg=204   ctermfg=229   cterm=bold        " reg bg,        fg: yellow

" ======================================================================================================================
" }}}1

" vim
highlight link vimFunction Identifier

let g:colors_name = "acme"

