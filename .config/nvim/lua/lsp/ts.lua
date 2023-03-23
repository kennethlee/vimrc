local lsp_config = require("lspconfig")

lsp_config.tsserver.setup({
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
})
