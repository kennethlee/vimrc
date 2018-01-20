highlight clear

" for cterm, 'black' might get overwritten by the terminal emulator, so we use
" 232 (#080808), which is close enough.

highlight! Normal guibg=#ffffd7 guifg=#000000 gui=NONE ctermbg=230 ctermfg=black cterm=NONE
highlight! NonText guibg=NONE guifg=#af8700 gui=NONE ctermbg=NONE ctermfg=136 cterm=NONE
highlight! StatusLine guibg=#aeeeee guifg=#000000 gui=NONE ctermbg=159 ctermfg=232 cterm=NONE
highlight! StatusLineNC guibg=#eaffff guifg=#000000 gui=NONE ctermbg=194 ctermfg=232 cterm=NONE
highlight! WildMenu guibg=#000000 guifg=#eaffff gui=NONE ctermbg=black ctermfg=159 cterm=NONE
highlight! VertSplit guibg=#ffffea guifg=#000000 gui=NONE ctermbg=159 ctermfg=232 cterm=NONE
highlight! Folded guibg=NONE guifg=#585858 gui=italic ctermbg=NONE ctermfg=240 cterm=italic
highlight! FoldColumn guibg=#fcfcce guifg=fg gui=NONE ctermbg=229 ctermfg=fg cterm=NONE
highlight! Conceal guibg=bg guifg=fg gui=NONE ctermbg=bg ctermfg=fg cterm=NONE
highlight! LineNr guibg=bg guifg=#505050 gui=NONE ctermbg=bg ctermfg=239 cterm=NONE
highlight! Visual guibg=#ffd787 guifg=NONE gui=NONE ctermbg=222 ctermfg=fg cterm=NONE

highlight! Statement guibg=bg guifg=fg gui=italic ctermbg=bg ctermfg=fg cterm=italic
highlight! Identifier guibg=bg guifg=fg gui=bold ctermbg=bg ctermfg=fg cterm=bold
highlight! Type guibg=bg guifg=fg gui=bold ctermbg=bg ctermfg=fg cterm=bold
highlight! PreProc guibg=bg guifg=fg gui=bold ctermbg=bg ctermfg=fg cterm=bold
highlight! Constant guibg=bg guifg=#101010 gui=bold ctermbg=bg ctermfg=233 cterm=italic
highlight! Comment guibg=bg guifg=#303030 gui=italic ctermbg=bg ctermfg=236 cterm=italic
highlight! Special guibg=bg guifg=fg gui=bold ctermbg=bg ctermfg=fg cterm=bold
highlight! SpecialKey guibg=bg guifg=fg gui=bold ctermbg=bg ctermfg=fg cterm=bold
highlight! Directory guibg=bg guifg=fg gui=bold ctermbg=bg ctermfg=fg cterm=bold
highlight! link Title Directory
highlight! link MoreMsg Comment

" vim
highlight link vimFunction Identifier

let g:colors_name = "acme"

