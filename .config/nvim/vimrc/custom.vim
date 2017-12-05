" CycleList {{{1

" cycle through location list
function! custom#CycleList(nextcom, firstcom)
  try
    try
      execute a:nextcom
    catch /^Vim\%((\a\+)\)\=:E553/
      execute a:firstcom
    catch /^Vim\%((\a\+)\)\=:E776/
    endtry
  catch /^Vim\%((\a\+)\)\=:E42/
  endtry
endfunction

"===============================================================================
" folds {{{1
" fold header {{{2

" better looking folds; right-alignment of line numbers + percentage of file
function! custom#VimFoldText()
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

"===============================================================================
" markdown {{{2

" fold at '#'
function! custom#MarkdownLevel()
  let h = matchstr(getline(v:lnum), '^#\+')
  if empty(h)
    return "="
  else
    return ">" . len(h)
  endif
endfunction

"===============================================================================
" gb's rename file {{{1

function! custom#RenameFile()
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'), 'file')

  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' . old_name
    redraw!
  endif
endfunction

"===============================================================================
" statusline: git branch {{{1

" show git branch of current file if it's under version control
function! custom#GitBranch()
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
  autocmd BufNewFile,BufRead * let b:gitbranch = custom#GitBranch()
augroup END

"===============================================================================
" WipeReg {{{1

" `:WipeReg` to clear registers
command! WipeReg for i in range(34,122) | silent! call setreg(nr2char(i), [])
  \| endfor

" call `WipeReg` on startup
" autocmd VimEnter * WipeReg

"===============================================================================
" }}}1

