local custom_attach = require("lsp/custom_attach")
local custom_on_init = require("lsp/custom_on_init")
local lsp_config = require("lspconfig")

lsp_config.tsserver.setup {
  on_attach = custom_attach,
  on_init = custom_on_init,
  root_dir = vim.loop.cwd,
  init_options = {
    documentFormatting = false,
  },
  filetypes = {
    "javascript",
    "javascriptreact",
    "javascript.jsx",
    "typescript",
    "typescript.tsx",
    "typescriptreact",
  },
}
