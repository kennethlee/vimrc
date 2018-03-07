" filetype {{{1
" javascript {{{2

" augroup filetype_javascript
"   autocmd!
"   " lint on save
"   autocmd filetype_javascript BufWritePost <buffer> silent make! <afile> | silent redraw!
" augroup END

" ==============================================================================
" highlight {{{1

augroup settings_highlight
  autocmd!
augroup END

" ==============================================================================
" quickfix {{{1

augroup settings_quickfix
  autocmd!
  " automatically close corresponding loclist when quitting its parent window
  autocmd settings_quickfix QuitPre * if &filetype != 'qf' | silent! lclose | endif
augroup END

" ==============================================================================
" statusline {{{1

augroup settings_statusline
  autocmd!
  " for `fxn#StatuslineWarningWhitespace()`
  autocmd settings_statusline BufWritePost,CursorHold * unlet! b:statusline_warning_whitespace
augroup END

" ==============================================================================
" terminal {{{1

augroup settings_terminal
  autocmd!
  autocmd settings_terminal TermOpen * setlocal nonumber norelativenumber
augroup END

" ==============================================================================
" }}}1

