" InsertTabWrapper() {{{1

function! fxn#InsertTabWrapper() abort
  let col = col('.') - 1
  if !col || getline('.')[col - 1] !~ '\k'
    return "\<Tab>"
  else
    return "\<C-p>"
  endif
endfunction

" ==============================================================================
" QuickfixToggle() {{{1

let g:quickfix_is_open = 0

function! fxn#QuickfixToggle() abort
  if g:quickfix_is_open
    cclose
    let g:quickfix_is_open = 0
    execute g:quickfix_return_to_window . "wincmd w"
  else
    let g:quickfix_return_to_window = winnr()
    copen
    let g:quickfix_is_open = 1
  endif
endfunction

" ==============================================================================
" RenameFile() {{{1

" rename current file
function! fxn#RenameFile() abort
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'), 'file')

  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' . old_name
    redraw!
  endif
endfunction

" ==============================================================================
" StatuslineGitBranch() {{{1

" show git branch of current file if it's under version control
function! fxn#StatuslineGitBranch() abort
  if &buftype == 'terminal' || &buftype == 'nofile' || &filetype == 'qf'
    return ''
  else
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
      return '[Git(' . substitute(branch, '\n', '', 'g') . ')]'
    endif
    return ''
  end
endfunction

augroup git_branch
  autocmd!
  autocmd BufNewFile,BufRead * let b:gitbranch = fxn#StatuslineGitBranch()
augroup END

" ==============================================================================
" StatuslineTabWarning() {{{1

function! fxn#StatuslineTabWarning() abort
  if !exists("b:statusline_tab_warning")
    let tabs = search('^\t', 'nw') != 0
    let spaces = search('^ ', 'nw') != 0

    if tabs && spaces
      let b:statusline_tab_warning =  '[mixed-indenting]'
    elseif (spaces && !&expandtab) || (tabs && &expandtab)
      let b:statusline_tab_warning = '[expandtab]'
    else
      let b:statusline_tab_warning = ''
    endif
  endif

  return b:statusline_tab_warning
endfunction

augroup warning_tab
  autocmd!
  autocmd BufWritePost * unlet! b:statusline_tab_warning
augroup END

" ==============================================================================
" StatuslineTrailingSpaceWarning() {{{1

"return '[\s]' if trailing white space is detected
function! fxn#StatuslineTrailingSpaceWarning() abort
  if !exists("b:statusline_trailing_space_warning")
    if search('\s\+$', 'nw') != 0
      let b:statusline_trailing_space_warning = '[\s]'
    else
      let b:statusline_trailing_space_warning = ''
    endif
  endif
  return b:statusline_trailing_space_warning
endfunction

"recalculate the trailing whitespace warning when idle, and after saving
augroup warning_trailing
  autocmd!
  autocmd CursorHold,BufWritePost * unlet! b:statusline_trailing_space_warning
augroup END

" ==============================================================================
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
" }}}1

