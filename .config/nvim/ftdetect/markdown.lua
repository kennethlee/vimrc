local autocmd = vim.api.nvim_create_autocmd

autocmd({ "BufNewFile", "BufRead" }, {
  pattern = { "*.markdown", "*.md", "*.mdown", "*.mkd", "*.mkdn" },
  command = "set filetype=markdown",
})
