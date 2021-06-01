local custom = require("lsp/custom")
local eslint = require("lsp/efm/eslint")
local lsp_config = require("lspconfig")

lsp_config.efm.setup {
  on_attach = function()
    custom.lsp_keymap()
  end,
  on_init = function()
    custom.on_init()
  end,
  filetypes = {
    "javascript",
    "javascriptreact",
    "javascript.jsx",
    "typescript",
    "typescript.tsx",
    "typescriptreact",
  },
  settings = {
    -- rootMarkers = {vim.loop.cwd()},
    rootMarkers = {".eslintrc.js", ".git/"},
    languages = {
      javascript = {eslint},
      javascriptreact = {eslint},
      ["javascript.jsx"] = {eslint},
      typescript = {eslint},
      ["typescript.tsx"] = {eslint},
      typescriptreact = {eslint},
    },
  },
}
