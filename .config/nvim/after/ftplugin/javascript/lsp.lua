local bin_name = "tsgo"
local cmd = { bin_name, "--lsp", "--stdio" }
local filetypes = {
  "javascript",
  "javascriptreact",
  "javascript.jsx",
  "typescript",
  "typescriptreact",
  "typescript.tsx",
}

vim.lsp.start({
  name = "tsgo",
  cmd = cmd,
  filetypes = filetypes,
  -- settings = {
  --   javascript = {
  --     inlayHints = {
  --       includeInlayEnumMemberValueHints = true,
  --       includeInlayFunctionLikeReturnTypeHints = true,
  --       includeInlayFunctionParameterTypeHints = true,
  --       includeInlayParameterNameHints = "all", -- "none" | "literals" | "all";
  --       includeInlayParameterNameHintsWhenArgumentMatchesName = true,
  --       includeInlayPropertyDeclarationTypeHints = true,
  --       includeInlayVariableTypeHints = false,
  --     },
  --   },
  -- },
  root_dir = vim.fn.getcwd(),
  root_markers = { ".git" },
  init_options = {
    hostInfo = "neovim",
  },
})
