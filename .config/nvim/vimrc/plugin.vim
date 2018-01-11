" fzf {{{1

" work-around to enable use of <C-r>/<C-t> when using fzf in term window
" https://github.com/junegunn/fzf/issues/809
let $FZF_DEFAULT_OPTS .= ' --no-height'

" ==============================================================================
" vim's standard plugins {{{1

" pi_paren
highlight! link MatchParen IncSearch

" enable
runtime macros/matchit.vim

" disable
let g:loaded_netrwPlugin = 1

" ==============================================================================
" }}}1

