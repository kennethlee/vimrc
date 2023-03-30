local autocmd = vim.api.nvim_create_autocmd

autocmd({ "BufNewFile", "BufRead" }, {
  pattern = { "*.dat", "*.hledger", "*.j", "*.journal", "*.ledger" },
  command = "set filetype=ledger",
})
