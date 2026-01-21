local bin_name = "vscode-css-language-server"
local cmd = { bin_name, "--stdio" }
-- local filetypes = { "css" }

vim.lsp.start({
  name = bin_name,
  cmd = cmd,
  -- filetypes = filetypes,
  settings = {
    css = { validate = true },
    scss = { validate = true },
    less = { validate = true },
    capabilities = {
      textDocument = {
        completion = {
          completionItem = {
            snippetSupport = true,
          },
        },
      },
    },
  },
  root_dir = vim.loop.cwd()
})
