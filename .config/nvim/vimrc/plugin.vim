" lazy loading {{{1

augroup packadd_html
  autocmd!
  autocmd FileType html packadd html5.vim
augroup END

augroup packadd_javascript
  autocmd!
  autocmd FileType javascript packadd vim-javascript
  autocmd FileType javascript packadd vim-js-indent
  autocmd FileType javascript packadd vim-json
  autocmd FileType javascript packadd vim-jsx
augroup END

"===============================================================================
" ale {{{1

let g:ale_linters = { 'jsx': ['eslint'] }
" let g:ale_linter_aliases = { 'jsx': 'css' }

" lint only on save
" let g:ale_lint_on_enter = 0
" let g:ale_lint_on_text_changed = 'never'

" lint 500ms after entering normal mode
let g:ale_lint_on_enter = 0
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_delay = 1000

let g:ale_sign_warning = '!!'

"===============================================================================
" vim-closetag {{{1

" try to close the current tag in the following filetypes:
let g:closetag_filenames = '*.html,*.js,*.jsx'

" Make non-closing tags self-closing in the specified files:
let g:closetag_xhtml_filenames = '*.js,*.jsx'

" integer value [0|1]
" This will make the list of non-closing tags case sensitive (e.g. `<Link>`
" will be closed while `<link>` won't.)
let g:closetag_emptyTags_caseSensitive = 1

" Add > at current position without closing the current tag, default is ''
let g:closetag_close_shortcut = '<leader>>'

"===============================================================================
" undotree {{{1

" if set, let undotree window get focus after being opened, otherwise
" focus will stay in current window
if !exists('g:undotree_SetFocusWhenToggle')
  let g:undotree_SetFocusWhenToggle = 1
endif

" highlight changed text
if !exists('g:undotree_HighlightChangedText')
  let g:undotree_HighlightChangedText = 1
endif

"===============================================================================
" vim-json {{{1

let g:vim_json_syntax_conceal = 0

"===============================================================================
" vim-gitgutter {{{1

set signcolumn=yes
let g:gitgutter_eager = 0
let g:gitgutter_async = 0
highlight clear SignColumn

"===============================================================================
" vim's standard plugins {{{1

" enable
runtime macros/matchit.vim

" disable
let g:loaded_netrwPlugin = 1

"===============================================================================
" }}}1

