if exists(":CompilerSet") != 2
  command -nargs=* CompilerSet setlocal <args>
endif

CompilerSet makeprg=eslint_d\ --format\ compact
CompilerSet errorformat=%f:\ line\ %l\\,\ col\ %c\\,\ %m,%-G%.%#

" autocmd UserLint BufWritePost <buffer> silent lmake! <afile> | silent redraw!
autocmd UserLint VimLeave * !eslint_d stop
