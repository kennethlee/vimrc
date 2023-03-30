local opt_local = vim.opt_local

opt_local.colorcolumn = "81"

-- makeprg: eslint / formatprg: prettier ---------------------------------------

-- not currently in use, but left here for posterity.
vim.cmd([[
  " use `:make` cmd to populate loclist.
  if executable("eslint_d")
    compiler eslint
  endif

  " use `gq` operator.
  if executable("prettier")
    setlocal formatprg=npx\ prettier\ --stdin-filepath\ %\ --trailing-comma\ all
    " format buffer before write.
    " autocmd User_Lint BufWritePre <buffer> normal gggqG
  endif
]])

-- lsp -------------------------------------------------------------------------

local bin_name = "typescript-language-server"
local cmd = { bin_name, "--stdio" }
local filetypes = {
  "javascript",
  "javascriptreact",
  "javascript.jsx",
  "typescript",
  "typescriptreact",
  "typescript.tsx",
}

vim.lsp.start({
  name = "tsserver",
  cmd = cmd,
  filetypes = filetypes,
  root_dir = vim.fn.getcwd(),
  settings = {
    hostInfo = "neovim",
  },
})
