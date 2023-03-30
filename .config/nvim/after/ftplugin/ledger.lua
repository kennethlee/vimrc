local opt_local = vim.opt_local

vim.cmd([[
  autocmd UserFold BufNewFile,BufRead,BufWinEnter <buffer>
    \   setlocal foldmethod=marker
]])
opt_local.commentstring = ";%s"
