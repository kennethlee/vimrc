" GitBranch() {{{1

" show git branch of current file if it's under version control
function! fxn#GitBranch() abort
  if &buftype != 'terminal'
    " stores cwd
    let lastdir = getcwd()
    " temporarily changes to dir containing the buffer
    let bufdir = expand('%:p:h')
    if bufdir != lastdir
      lcd `=bufdir`
    endif
    " retrieves git branch after changing dir...
    let branch = system("git branch --no-color 2> /dev/null | cut -d' ' -f2")
    " then changes back
    if bufdir != lastdir
      lcd `=lastdir`
    endif

    if branch != ''
      return '  GIT(' . substitute(branch, '\n', '', 'g') . ') '
    endif
    return ''
  else
    return ''
  end
endfunction

augroup gitbranch
  autocmd!
  autocmd BufNewFile,BufRead * let b:gitbranch = fxn#GitBranch()
augroup END

" ==============================================================================
" }}}1

