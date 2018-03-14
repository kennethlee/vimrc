" highlight {{{1

augroup vimrc_highlight
  autocmd!
augroup END

" ==============================================================================
" lint {{{1

augroup vimrc_lint
  autocmd!
  " automatically open loclist/qf after executing quickfix commands and there
  " are valid errors
  autocmd vimrc_lint QuickFixCmdPost [^l]* botright cwindow
  autocmd vimrc_lint QuickFixCmdPost l* lwindow
augroup END

" ==============================================================================
" quickfix {{{1

augroup vimrc_quickfix
  autocmd!
  " automatically close corresponding loclist when quitting its parent window
  autocmd vimrc_quickfix QuitPre * if &filetype != 'qf' | silent! lclose | endif
augroup END

" ==============================================================================
" startup {{{1

augroup vimrc_startup
  autocmd!
  autocmd vimrc_startup VimEnter * WipeMarks
  autocmd vimrc_startup VimEnter * WipeReg
augroup END

" ==============================================================================
" statusline {{{1

augroup vimrc_statusline
  autocmd!
  " for `fxn#StatuslineWarningWhitespace()`
  autocmd vimrc_statusline BufWritePost,CursorHold * unlet! b:statusline_warning_whitespace
augroup END

" ==============================================================================
" terminal {{{1

augroup vimrc_terminal
  autocmd!
  autocmd vimrc_terminal TermOpen * setlocal nonumber norelativenumber
augroup END

" ==============================================================================
" }}}1

