" fold lines {{{1

" better looking folds; right-alignment of line numbers + percentage of file.
" taken from https://github.com/NagatoPain/dotfiles/blob/master/.vim/vimrc
function! VimFoldText()
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

set foldtext=VimFoldText()

"===============================================================================
" global options {{{2

" fold options. See ':help fold-options' for more.
set foldenable
set foldlevel=0
set foldcolumn=0
set foldnestmax=6

"===============================================================================
" gb's rename fIle {{{1

function! RenameFile()
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'), 'file')

  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' . old_name
    redraw!
  endif
endfunction

"===============================================================================
" gb's tabs {{{1

" indent if at the beginning of a line, else, do completion.
function! InsertTabWrapper()
  let col = col('.') - 1
  if !col || getline('.')[col - 1] !~ '\k'
    return "\<Tab>"
  else
    return "\<C-p>"
  endif
endfunction

"===============================================================================
" pastetoggle {{{1

" 'bracketed paste mode': enables the terminal emulator to tell the program
" connected to the tty when the user pastes text, so that the program won't
" interpret it as editing commands."
if &term =~ "xterm.*"
  let &t_ti = &t_ti . "\e[?2004h"
  let &t_te = "\e[?2004l" . &t_te

  function XTermPasteBegin(ret)
    set pastetoggle=<Esc>[201~
    set paste
    return a:ret
  endfunction

  map <expr> <Esc>[200~ XTermPasteBegin("i")
  imap <expr> <Esc>[200~ XTermPasteBegin("")
  cmap <Esc>[200~ <nop>
  cmap <Esc>[201~ <nop>
endif

"===============================================================================
" steve losh' quickfix window toggle {{{1

let g:quickfix_is_open = 0

function! s:QuickfixToggle()
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

"===============================================================================
" spell check toggle {{{1

set spelllang=en_us
function! SpellToggle()
  if &spell == 1
    set nospell
  else
    set spell
  endif
endfunction

"===============================================================================
" }}}1
