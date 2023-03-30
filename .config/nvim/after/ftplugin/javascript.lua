local opt_local = vim.opt_local

opt_local.colorcolumn = "81"

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