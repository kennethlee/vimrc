if exists(":CompilerSet") != 2
  command -nargs=* CompilerSet setlocal <args>
endif

CompilerSet errorformat=%f:\ line\ %l\\,\ col\ %c\\,\ %m,%-G%.%#
CompilerSet makeprg=eslint_d\ --format\ compact

" autocmd Lint BufWritePost <buffer> silent lmake! <afile> | silent redraw!
autocmd Lint VimLeave * !eslint_d stop
