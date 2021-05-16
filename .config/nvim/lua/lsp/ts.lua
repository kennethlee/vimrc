local custom = require "lsp/custom"
local lsp_config = require "lspconfig"

lsp_config.tsserver.setup {
  on_attach = function()
    custom.lsp_keymap()
  end,
  on_init = function()
    custom.on_init()
  end,
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
