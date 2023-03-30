local opt_local = vim.opt_local

vim.cmd([[
  autocmd UserFold BufNewFile,BufRead,BufWinEnter <buffer>
    \   setlocal foldcolumn=1
    \|  setlocal foldmethod=indent
    \|  setlocal foldnestmax=5
]])
opt_local.foldlevel = 2
