local bin_name = "harper-ls"
local cmd = { bin_name, "--stdio" }
-- local filetypes = {
--   "markdown",
-- }

vim.lsp.start({
  name = bin_name,
  cmd = cmd,
  -- filetypes = filetypes,
  root_dir = vim.fn.getcwd(),
})
