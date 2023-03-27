local bin_name = "typescript-language-server"
local cmd = { bin_name, "--stdio" }
local filetypes = {
  "javascript",
  "javascriptreact",
  "javascript.jsx",
  "typescript",
  "typescriptreact",
  "typescript.tsx",
},

vim.api.nvim_create_autocmd("FileType", {
  pattern = "javascript",
  callback = function()
    vim.lsp.start({
      name = "tsserver",
      cmd = cmd,
      filetypes = filetypes,
      root_dir = vim.fn.getcwd(),
      settings = {
        hostInfo = "neovim",
      },
    })
  end,
})
