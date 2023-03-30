vim.cmd([[
  function! MarkdownLevel() abort
    let l:currentline = getline(v:lnum)
    if match(l:currentline, '^#\{1,6}\s') >= 0
      let l:header_level = strlen(substitute(l:currentline, '^\(#\{1,6}\).*', '\1', ''))
      return '>' . l:header_level
    endif
    return '='
  endfunction
]])

vim.cmd([[
  autocmd UserFold BufNewFile,BufRead,BufWinEnter <buffer>
    \   setlocal foldcolumn=1
    \|  setlocal foldexpr=MarkdownLevel()
    \|  setlocal foldmethod=expr
]])
