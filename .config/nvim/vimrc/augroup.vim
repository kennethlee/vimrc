augroup vimrc_fold
  autocmd!
augroup END

augroup vimrc_highlight
  autocmd!
augroup END

augroup vimrc_lint
  autocmd!
  " automatically open loclist/qf after executing quickfix commands and there
  " are valid errors
  autocmd vimrc_lint QuickFixCmdPost [^l]* botright cwindow
  autocmd vimrc_lint QuickFixCmdPost l* lwindow
augroup END

augroup vimrc_quickfix
  autocmd!
  " automatically close corresponding loclist when quitting its parent window
  autocmd vimrc_quickfix QuitPre * if &filetype != 'qf' | silent! lclose | endif
augroup END

augroup vimrc_startup
  autocmd!
  autocmd vimrc_startup VimEnter * Wmarks
  autocmd vimrc_startup VimEnter * Wreg
augroup END

augroup vimrc_statusline
  autocmd!
  " for `fxn#StatuslineWarningWhitespace()`
  autocmd vimrc_statusline BufWritePost,CursorHold * unlet! b:statusline_warning_whitespace
augroup END

augroup vimrc_terminal
  autocmd!
  autocmd vimrc_terminal TermOpen * setlocal nonumber norelativenumber
augroup END

