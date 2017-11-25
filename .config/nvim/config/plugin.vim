" ale {{{1

let g:ale_linters={'jsx': ['eslint']}
" let g:ale_linter_aliases = {'jsx': 'css'}

" lint only on save
" let g:ale_lint_on_enter=0
" let g:ale_lint_on_text_changed='never'

" lint 500ms after entering normal mode
let g:ale_lint_on_enter=0
let g:ale_lint_on_text_changed='normal'
let g:ale_lint_delay=1000

let g:ale_sign_warning='!!'

"===============================================================================
" undotree {{{1

" if set, let undotree window get focus after being opened, otherwise
" focus will stay in current window
if !exists('g:undotree_SetFocusWhenToggle')
  let g:undotree_SetFocusWhenToggle=1
endif

" highlight changed text
if !exists('g:undotree_HighlightChangedText')
  let g:undotree_HighlightChangedText=1
endif

"===============================================================================
" vim-json {{{1

let g:vim_json_syntax_conceal=0

"===============================================================================
" vim-gitgutter {{{1

set signcolumn=yes
let g:gitgutter_eager=0
let g:gitgutter_async=0
highlight clear SignColumn

"===============================================================================
" vim's standard plugins {{{1

" enable
runtime macros/matchit.vim

" disable
let g:loaded_netrwPlugin=1

"===============================================================================
" }}}1

