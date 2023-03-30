vim.opt_local.bufhidden = "wipe"
vim.opt_local.buflisted = false

vim.cmd([[
  " automatically close corresponding loclist when quitting its parent window
  autocmd UserQuickfix QuitPre *
    \   if &filetype !=# 'qf'
    \|    silent! lclose
    \|  endif
]])

-- disable mappings for :Bnext/:Bprev if window focus is accidentally on quickfix/loclist.
local key_opts = { buffer = 0, noremap = true, silent = true }
vim.keymap.set("", "<C-h>", "<Nop>", key_opts)
vim.keymap.set("", "<C-l>", "<Nop>", key_opts)
