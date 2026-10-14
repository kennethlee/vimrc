-- https://github.com/neovim/nvim-lspconfig/issues/4467
-- https://github.com/neovim/nvim-lspconfig/blob/master/lsp/tsc.lua
local bin_name = "tsc"
local cmd = { bin_name, "--lsp", "--stdio" }
local filetypes = {
  "javascript",
  "javascriptreact",
  "typescript",
  "typescriptreact",
}

vim.lsp.start({
  name = bin_name,
  cmd = cmd,
  filetypes = filetypes,
  settings = {
    ["js/ts"] = {
      inlayHints = {
        parameterNames = {
          enabled = "literals",
          suppressWhenArgumentMatchesName = true,
        },
        parameterTypes = { enabled = true },
        variableTypes = { enabled = true },
        propertyDeclarationTypes = { enabled = true },
        functionLikeReturnTypes = { enabled = true },
        enumMemberValues = { enabled = true },
      },
      referencesCodeLens = {
        enabled = true,
        showOnAllFunctions = true,
      },
      implementationsCodeLens = {
        enabled = true,
        showOnInterfaceMethods = true,
        showOnAllClassMethods = true,
      },
    },
  },
  root_dir = vim.fn.getcwd(),
  root_markers = { ".git" },
  init_options = {
    hostInfo = "neovim",
  },
})
