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
" ToggleQuickfix() {{{1

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

function! fxn#ToggleQuickfix() abort
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

" VimFoldText() {{{1

function! fxn#VimFoldText() abort
  let end_chars = repeat(' ', winwidth(0))
  return getline(v:foldstart).end_chars
endfunction

" ==============================================================================
" }}}1

