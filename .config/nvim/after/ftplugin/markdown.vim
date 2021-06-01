if &filetype ==# 'markdown'
  function! MarkdownLevel() abort
    let l:currentline = getline(v:lnum)
    if match(l:currentline, '^#\{1,6}\s') >= 0
      let l:header_level = strlen(substitute(l:currentline, '^\(#\{1,6}\).*', '\1', ''))
      return '>' . l:header_level
    endif
    return '='
  endfunction

  autocmd User_Fold BufNewFile,BufRead,BufWinEnter <buffer>
    \   setlocal foldcolumn=1
    \|  setlocal foldexpr=MarkdownLevel()
    \|  setlocal foldmethod=expr
  setlocal expandtab
  setlocal shiftwidth=2
  setlocal softtabstop=2
  setlocal tabstop=2
endif
