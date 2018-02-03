" IndTxtObj() {{{1

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
  while p > 0 && (nextblank || indent(p) >= i )
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
  while p <= lastline && (nextblank || indent(p) >= i )
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
" NvimTerminalToggle() {{{1

let s:nvim_terminal_window = -1
let s:nvim_terminal_buffer = -1
let s:nvim_terminal_job_id = -1

function! NvimTerminalOpen() abort
  " check if buffer exists, if not create a window and a buffer
  if !bufexists(s:nvim_terminal_buffer)
    " creates a window call nvim_terminal
    new nvim_terminal
    " moves to the window below the current one
    wincmd L
    let s:nvim_terminal_job_id = termopen($SHELL, { 'detach': 1 })

    " change the name of the buffer to "Terminal 1"
    silent file Terminal\ 1
    " gets the id of the terminal window
    let s:nvim_terminal_window = win_getid()
    let s:nvim_terminal_buffer = bufnr('%')

    " the buffer of the terminal won't appear in the list of the buffers
    " when calling :buffers command
    set nobuflisted
  else
    if !win_gotoid(s:nvim_terminal_window)
      sp
      " moves to the window below the current one
      wincmd L
      buffer Terminal\ 1
      " gets the id of the terminal window
      let s:nvim_terminal_window = win_getid()
    endif
  endif
endfunction

function! NvimTerminalClose() abort
  if win_gotoid(s:nvim_terminal_window)
    " close the current window
    hide
  endif
endfunction

function! fxn#NvimTerminalToggle() abort
  if win_gotoid(s:nvim_terminal_window)
    call NvimTerminalClose()
  else
    call NvimTerminalOpen()
  endif
endfunction

augroup settings_terminal
  autocmd!
  autocmd TermOpen * setlocal nonumber norelativenumber
augroup END

" ==============================================================================
" QuickfixToggle() {{{1

function! GetBufferList() abort
  redir =>buflist
  silent! ls
  redir END
  return buflist
endfunction

function! BufferIsOpen(bufname) abort
  let buflist = GetBufferList()
  for bufnum in map(filter(split(buflist, '\n'), 'v:val =~ "'.a:bufname.'"'), 'str2nr(matchstr(v:val, "\\d\\+"))')
    if bufwinnr(bufnum) != -1
      return 1
    endif
  endfor
  return 0
endfunction

function! fxn#QuickfixToggle() abort
  if BufferIsOpen("Quickfix List")
    cclose
  else
    copen
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
" StatuslineWarningWhitespace() {{{1

function! fxn#StatuslineWarningWhitespace() abort
  if !exists("b:statusline_warning_whitespace")
    let tabs = search('\t', 'nw') != 0
    let spaces = search(' \+$\| \+\ze\t', 'nw') != 0

    if (tabs && spaces)
      let b:statusline_warning_whitespace = '[\t\|\s]'
    elseif tabs
      let b:statusline_warning_whitespace = '[\t]'
    elseif spaces
      let b:statusline_warning_whitespace = '[\s]'
    else
      let b:statusline_warning_whitespace = ''
    endif
  endif

  return b:statusline_warning_whitespace
endfunction

augroup warning_whitespace
  autocmd!
  autocmd BufWritePost,CursorHold * unlet! b:statusline_warning_whitespace
augroup END

" ==============================================================================
" VimFoldText() {{{1

function! fxn#VimFoldText() abort
  let end_chars = repeat(' ', winwidth(0))
  return getline(v:foldstart).end_chars
endfunction

" ==============================================================================
" }}}1

