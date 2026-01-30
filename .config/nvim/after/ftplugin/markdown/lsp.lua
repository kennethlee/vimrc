local bin_name = "harper-ls"
local cmd = { bin_name, "--stdio" }
-- local filetypes = {
--   "markdown",
-- }

vim.lsp.start({
  name = bin_name,
  cmd = cmd,
  -- filetypes = filetypes,
  settings = {
    [bin_name] = {
      isolateEnglish = true,
      linters = {
        AvoidCurses = false,
        Dashes = false,
        LongSentences = false,
        OrthographicConsistency = false,
        WrongQuotes = true,
      },
      markdown = {
        IgnoreLinkTitle = true,
      },
      maxFileLength = 1000000000,
      userDictPath = vim.fn.stdpath("config") .. "/dict.txt",
    }
  },
  root_dir = vim.fn.getcwd(),
})
