" statusline {{{1

" for `fxn#StatuslineWarningWhitespace()`
augroup warning_whitespace
  autocmd!
  autocmd BufWritePost,CursorHold * unlet! b:statusline_warning_whitespace
augroup END

" ==============================================================================
" terminal {{{1

augroup settings_terminal
  autocmd!
  autocmd TermOpen * setlocal nonumber norelativenumber
augroup END

" ==============================================================================
" }}}1

