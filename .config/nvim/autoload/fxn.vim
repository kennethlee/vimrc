" ChangeReg {{{1

function! fxn#ChangeReg() abort
  let x = nr2char(getchar())
  call feedkeys("q:ilet @" . x . " = \<C-r>\<C-r>=string(@" . x . ")\<CR>\<Esc>0f'", 'n')
endfunction

" ==============================================================================
" IndTxtObj {{{1

function! fxn#IndTxtObj(inner) abort
  let curline = line(".")
  let lastline = line("$")
  let i = indent(line(".")) - &shiftwidth * (v:count1 - 1)
  let i = i < 0 ? 0 : i
  if getline(".") =~ "^\\s*$"
    return
  endif
  let p = line(".") - 1
  let nextblank = getline(p) =~ "^\\s*$"
  while p > 0 && (nextblank || indent(p) >= i)
    -
    let p = line(".") - 1
    let nextblank = getline(p) =~ "^\\s*$"
  endwhile
  if (!a:inner)
    -
  endif
  normal! 0V
  call cursor(curline, 0)
  let p = line(".") + 1
  let nextblank = getline(p) =~ "^\\s*$"
  while p <= lastline && (nextblank || indent(p) >= i)
    +
    let p = line(".") + 1
    let nextblank = getline(p) =~ "^\\s*$"
  endwhile
  if (!a:inner)
    +
  endif
  normal! $
endfunction

" ==============================================================================
" InsertTabWrapper {{{1

function! fxn#InsertTabWrapper() abort
  let col = col('.') - 1
  if !col || getline('.')[col - 1] !~ '\k'
    return "\<Tab>"
  else
    return "\<C-p>"
  endif
endfunction

" ==============================================================================
" NvimTerminalToggle {{{1

let s:term_buf = 0
let s:term_win = 0

function! fxn#NvimTerminalToggle() abort
  if win_gotoid(s:term_win)
    hide
  else
    botright new
    exec "resize " . &lines / 2
    setlocal nobuflisted
    try
      exec "buffer " . s:term_buf
    catch
      call termopen($SHELL, {"detach": 0})
      let s:term_buf = bufnr("")
    endtry
    startinsert!
    let s:term_win = win_getid()
  endif
endfunction

" ==============================================================================
" RemoveFancyCharacters {{{1

function! fxn#RemoveFancyCharacters() abort
  let typo = {}
  let typo["“"] = '"'
  let typo["”"] = '"'
  let typo["‘"] = "'"
  let typo["’"] = "'"
  let typo["–"] = '--'
  let typo["—"] = '---'
  let typo["…"] = '...'
  :exe ":%s/".join(keys(typo), '\|').'/\=typo[submatch(0)]/ge'
endfunction

command! RemoveFancyCharacters :call fxn#RemoveFancyCharacters()

" ==============================================================================
" RenameFile {{{1

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
" VimFoldText {{{1

function! fxn#VimFoldText() abort
  let end_chars = repeat(' ', winwidth(0))
  return getline(v:foldstart).end_chars
endfunction

" ==============================================================================
" }}}1

