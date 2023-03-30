local opt_local = vim.opt_local

opt_local.bufhidden = "wipe"
opt_local.buflisted = false

vim.cmd([[
  " automatically close corresponding loclist when quitting its parent window
  autocmd UserQuickfix QuitPre *
    \   if &filetype !=# 'qf'
    \|    silent! lclose
    \|  endif
]])

-- disable mappings for :Bnext/:Bprev if window focus is accidentally on quickfix/loclist.
local key_opts = { buffer = 0, noremap = true, silent = true }
local set = vim.keymap.set
set("", "<C-h>", "<Nop>", key_opts)
set("", "<C-l>", "<Nop>", key_opts)
