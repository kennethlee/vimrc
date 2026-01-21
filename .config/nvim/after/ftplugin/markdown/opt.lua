local opt_local = vim.opt_local

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

opt_local.foldcolumn = "1"
opt_local.foldexpr = "MarkdownLevel()"
opt_local.foldmethod = "expr"
opt_local.foldnestmax = 6
