vim.cmd([[
  autocmd UserFold BufNewFile,BufRead,BufWinEnter <buffer>
    \   setlocal foldcolumn=1
    \|  setlocal foldmethod=marker
]])
