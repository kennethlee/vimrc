local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

augroup("UserFold", { clear = true })
augroup("UserHighlight", { clear = true })
augroup("UserLint", { clear = true })

local user_quickfix = augroup("UserQuickfix", { clear = true })
autocmd({ "QuickFixCmdPost" }, {
  pattern = "[^l]*",
  group = user_quickfix,
  command = "botright cwindow",
  desc = "Make quickfix window always occupy the full width.",
})
autocmd({ "QuickFixCmdPost" }, {
  pattern = "l*",
  group = user_quickfix,
  command = "lwindow",
  desc = "Automatically open location list if there are errors for the current window.",
})

local user_startup = augroup("UserStartup", { clear = true })
autocmd({ "VimEnter" }, {
  pattern = "*",
  group = user_startup,
  command = "WipeMarks",
})
autocmd({ "VimEnter" }, {
  pattern = "*",
  group = user_startup,
  command = "WipeRegisters",
})

local user_misc = augroup("UserMisc", { clear = true })
autocmd({ "BufWritePre" }, {
  pattern = "*",
  group = user_misc,
  command = "%s/\\s\\+$//e",
  desc = "Remove trailing whitespace before save.",
})
autocmd({ "BufWritePost" }, {
  pattern = vim.env.MYVIMRC,
  group = user_misc,
  command = "source $MYVIMRC",
  desc = "Reload vimrc after save.",
})
