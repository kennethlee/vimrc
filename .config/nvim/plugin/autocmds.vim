" quickfix {{{1

augroup settings_quickfix
  autocmd!
  " automatically close corresponding loclist when quitting a window
  if exists('##QuitPre')
    autocmd QuitPre * if &filetype != 'qf' | silent! lclose | endif
  endif
augroup END

" ==============================================================================
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

