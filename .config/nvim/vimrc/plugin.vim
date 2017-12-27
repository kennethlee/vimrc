" fzf {{{1

" work-around to enable use of <C-r>/<C-t> when using fzf in term window
" https://github.com/junegunn/fzf/issues/809
let $FZF_DEFAULT_OPTS .= ' --no-height'

" ==============================================================================
" vim's standard plugins {{{1

" pi_paren
highlight MatchParen ctermbg=gray guibg=gray

" enable
let loaded_matchit = 0

" disable
let g:loaded_netrwPlugin = 1

" ==============================================================================
" }}}1

