" vim-json {{{1

let g:vim_json_syntax_conceal = 0

" ==============================================================================
" vim-gitgutter {{{1

set signcolumn=yes
let g:gitgutter_eager = 0
let g:gitgutter_async = 0
highlight clear SignColumn

" ==============================================================================
" vim's standard plugins {{{1

" enable
runtime macros/matchit.vim

" disable
let g:loaded_netrwPlugin = 1

" ==============================================================================
" }}}1

