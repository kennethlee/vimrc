local custom_attach = require("lsp/custom_attach")
local custom_on_init = require("lsp/custom_on_init")
local eslint = require("lsp/efm/eslint")
local lsp_config = require("lspconfig")

lsp_config.efm.setup {
  on_attach = custom_attach,
  on_init = custom_on_init,
  init_options = {documentFormatting = true},
  filetypes = {
    "javascript",
    "javascriptreact",
    "javascript.jsx",
    "typescript",
    "typescript.tsx",
    "typescriptreact"
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
      typescriptreact = {eslint}
    },
  },
}
