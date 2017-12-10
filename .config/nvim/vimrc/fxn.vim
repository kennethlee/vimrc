" VimFoldText() {{{1

" better looking folds; right-alignment of line numbers + percentage of file
function! fxn#VimFoldText() abort
  let fs = v:foldstart

  while getline(fs) =~ '^\s*$'
    let fs = nextnonblank(fs + 1)
  endwhile

  if fs > v:foldend
    let line = getline(v:foldstart)
  else
    let line = getline(fs)
  endif

  let line = " " . substitute(line, '/\*\|\*/\|{'.'{{\d\=', '', 'g') . " "
  let w = winwidth(0) - &foldcolumn - (&number ? 8 : 0)
  let foldSize = 1 + v:foldend - v:foldstart
  let foldSizeStr = " " . foldSize . " lines "
  let foldLevelStr = repeat(" + ", v:foldlevel) . "[" . v:foldlevel . "]"
  let lineCount = line("$")
  let foldPercentage = "[" . printf("%4.1f", (foldSize*1.0)/lineCount*100)
    \. "%] "
  let expansionString = repeat(".", w - strwidth(foldSizeStr) - strwidth(line)
    \- strwidth(foldLevelStr) - strwidth(foldPercentage))
  return foldLevelStr . line . expansionString . foldSizeStr. foldPercentage
endfunction

" ==============================================================================
" GitBranch() {{{1

" show git branch of current file if it's under version control
function! fxn#GitBranch() abort
" function! custom#GitBranch() abort
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
    return 'GIT(' . substitute(branch, '\n', '', 'g') . ')'
  endif
  return ''
endfunction

augroup gitbranch
  autocmd!
  autocmd BufNewFile,BufRead * let b:gitbranch = fxn#GitBranch()
augroup END

" ==============================================================================
" NextIndent() {{{1

" jump to previous / next line with same level of indentation as current
function! fxn#NextIndent(exclusive, fwd, lowerlevel, skipblanks) abort
  let line = line('.')
  let column = col('.')
  let lastline = line('$')
  let indent = indent(line)
  let stepvalue = a:fwd ? 1 : -1
  while (line > 0 && line <= lastline)
    let line = line + stepvalue
    if ( ! a:lowerlevel && indent(line) == indent ||
          \ a:lowerlevel && indent(line) < indent)
      if (! a:skipblanks || strlen(getline(line)) > 0)
        if (a:exclusive)
          let line = line - stepvalue
        endif
        exe line
        exe "normal " column . "|"
        return
      endif
    endif
  endwhile
endfunction

" ==============================================================================
" WipeReg {{{1

" `:WipeReg` to clear registers
command! WipeReg for i in range(34,122) | silent! call setreg(nr2char(i), [])
  \| endfor

" call `WipeReg` on startup
autocmd VimEnter * WipeReg

" ==============================================================================
" }}}1
