local lsp_config = require("lspconfig")

-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#tsserver
lsp_config.tsserver.setup({
  cmd = { "typescript-language-server", "--stdio" },
  filetypes = {
    "javascript",
    "javascriptreact",
    "javascript.jsx",
    "typescript",
    "typescriptreact",
    "typescript.tsx",
  },
  init_options = {
    hostInfo = "neovim",
  },
  root_dir = vim.loop.cwd,
  single_file_support = true,
})
