if exists(":CompilerSet") != 2
  command -nargs=* CompilerSet setlocal <args>
endif

" read this (romainl)!
" https://www.reddit.com/r/vim/comments/pgjsqb/comment/hbffy2i/

autocmd UserLint BufWritePost <buffer> silent lmake! <afile> | silent redraw!
autocmd UserLint VimLeave * !shellcheck stop
