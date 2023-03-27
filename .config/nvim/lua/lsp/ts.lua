vim.api.nvim_create_autocmd("FileType", {
  pattern = "javascript",
  callback = function()
    vim.lsp.start({
      name = "tsserver",
      cmd = { "typescript-language-server", "--stdio" },
      filetypes = {
        "javascript",
        "javascriptreact",
        "javascript.jsx",
        "typescript",
        "typescriptreact",
        "typescript.tsx",
      },
      root_dir = vim.fn.getcwd(),
      single_file_support = true,
    })
  end,
})
