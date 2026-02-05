if exists("current_compiler")
  finish
endif
let current_compiler = "shellcheck"

if exists(":CompilerSet") != 2
  command -nargs=* CompilerSet setlocal <args>
endif

CompilerSet makeprg=shellcheck\ -f\ gcc\ %
CompilerSet errorformat+=%f:%l:%c\ %m

autocmd UserLint BufWritePost <buffer> silent lmake! <afile> | silent redraw!
autocmd UserLint VimLeave * !shellcheck stop
