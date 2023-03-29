vim.cmd([[
  autocmd User_Fold BufNewFile,BufRead,BufWinEnter <buffer>
    \   setlocal foldcolumn=1
    \|  setlocal foldmethod=marker
]])
vim.opt_local.expandtab = true
vim.opt_local.shiftwidth = 2
vim.opt_local.softtabstop = 2
vim.opt_local.tabstop = 2
