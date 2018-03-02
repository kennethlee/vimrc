" BufModified {{{1

function! stl#BufModified() abort
  if &modified
    return '[+]'
  else
    return ''
  endif
endfunction

" ==============================================================================
" ExpandTab {{{1

function! stl#ExpandTab() abort
  if &expandtab
    return ''
  else
    return '[noet]'
  endif
endfunction

" ==============================================================================
" FileEncoding {{{1

function! stl#FileEncoding() abort
  if &fileencoding != 'utf-8' && &fileencoding != ''
    return '['.&fileencoding.']'
  else
    return ''
  endif
endfunction

" ==============================================================================
" FileFormat {{{1

function! stl#FileFormat() abort
  if &fileformat != 'unix'
    return '['.&fileformat.']'
  else
    return ''
  endif
  endif
endfunction

" ==============================================================================
" WarningWhitespace {{{1

function! stl#WarningWhitespace() abort
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

" ==============================================================================
" }}}1

