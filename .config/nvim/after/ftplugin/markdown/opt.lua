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

vim.opt_local.foldcolumn = "1"
vim.opt_local.foldexpr = "MarkdownLevel()"
vim.opt_local.foldmethod = "expr"
vim.opt_local.foldnestmax = 6
