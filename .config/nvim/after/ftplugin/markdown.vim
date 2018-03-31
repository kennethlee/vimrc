if &filetype ==# 'markdown'
  function! MarkdownLevel() abort
    let currentline = getline(v:lnum)
    if match(currentline, '^#\{1,6}\s') >= 0
      let header_level = strlen(substitute(currentline, '^\(#\{1,6}\).*', '\1', ''))
      return '>' . header_level
    endif
    return '='
  endfunction

  autocmd vimrc_fold BufNewFile,BufRead,BufWinEnter <buffer>
    \   setlocal foldcolumn=1
    \|  setlocal foldexpr=MarkdownLevel()
    \|  setlocal foldmethod=expr
endif

