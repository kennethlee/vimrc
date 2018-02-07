" statusline

" for `fxn#StatuslineWarningWhitespace()`
augroup warning_whitespace
  autocmd!
  autocmd BufWritePost,CursorHold * unlet! b:statusline_warning_whitespace
augroup END

" ==============================================================================
" terminal

augroup settings_terminal
  autocmd!
  autocmd TermOpen * setlocal nonumber norelativenumber
augroup END

" ==============================================================================

