vim.cmd([[
  autocmd UserFold BufNewFile,BufRead,BufWinEnter <buffer>
    \   setlocal foldcolumn=1
    \|  setlocal foldmethod=indent
    \|  setlocal foldnestmax=4
]])

-- formatprg: prettier ---------------------------------------------------------

-- not currently in use, but left here for posterity.
vim.cmd([[
  " use `gq` operator.
  if executable("prettier")
    setlocal formatprg=npx\ prettier\ --stdin-filepath\ %\ --trailing-comma\ all
    " autocmd User_Lint BufWritePre <buffer> normal gggqG
  endif
]])
