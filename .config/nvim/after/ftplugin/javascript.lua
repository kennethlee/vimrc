local opt_local = vim.opt_local

opt_local.colorcolumn = "81"

-- makeprg / formatprg ---------------------------------------------------------

local executable = vim.fn.executable

-- eslint_d: use `:lmake %` to populate loclist.
if executable("eslint_d") == 1 then
  vim.cmd("compiler eslint")
end

-- prettier: use `gq` operator.
if executable("prettier") == 1 then
  opt_local.formatprg = "npx prettier --stdin-filepath % --trailing-comma all"
end

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
