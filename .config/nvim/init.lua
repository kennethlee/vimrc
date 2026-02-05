-- opt {{{1

-- encoding must be set before scriptencoding
vim.o.encoding = "utf-8"
vim.o.modeline = false
vim.o.clipboard = "unnamedplus"
vim.cmd("filetype plugin indent on")

-- disable
vim.g.loaded_2html_plugin = 1
vim.g.loaded_getscript = 1
vim.g.loaded_getscriptPlugin = 1
vim.g.loaded_gzip = 1
vim.g.loaded_logiPat = 1
vim.g.loaded_netrw = 1
vim.g.loaded_netrwFileHandlers = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrwSettings = 1
vim.g.loaded_rplugin = 1
vim.g.loaded_rrhelper = 1
vim.g.loaded_tar = 1
vim.g.loaded_tarPlugin = 1
vim.g.loaded_tohtml = 1
vim.g.loaded_tutor = 1
vim.g.loaded_tutor_mode_plugin = 1
vim.g.loaded_vimball = 1
vim.g.loaded_vimballPlugin = 1
vim.g.loaded_zip = 1
vim.g.loaded_zipPlugin = 1

-- enable
vim.cmd("packadd cfilter")

-- prefer v0.7's new filetype detection scheme (now the default, but be explicit)
vim.g.do_filetype_lua = 1
vim.g.did_load_filetypes = 0

-- fzf
local fzf_path
if (vim.loop.os_uname().sysname == "Darwin") then
  fzf_path = "/opt/homebrew/opt/fzf"
end
vim.opt.rtp:append(fzf_path)

-- grep
if vim.fn.executable("rg") == 1 then
  vim.o.grepprg = "rg --vimgrep --no-heading --hidden --glob '!{.git,node_modules}/*'"
  vim.o.grepformat = "%f:%l:%c:%m,%f:%l:%m"
end

vim.o.autoindent = true
vim.o.autoread = true
vim.o.backspace = "indent,eol,start"
vim.o.backup = false
vim.o.breakindent = true
vim.o.cmdheight = 2
vim.o.cmdwinheight = 20
vim.o.completeopt = "fuzzy,noselect,menuone"
vim.o.cursorcolumn = true
vim.o.equalalways = false
vim.o.expandtab = true
vim.o.foldenable = false
vim.opt.foldopen = vim.opt.foldopen - { "block" }
-- vim.o.foldtext = "fold#HeaderText()"
vim.o.hidden = true
vim.o.hlsearch = true
vim.o.ignorecase = true
vim.o.inccommand = "nosplit"
-- when incsearch is set, entering a search pattern for / or ? and the current
-- match is displayed, CTRL-G will move to the next match, and CTRL-T will move
-- to the previous match, without pressing ENTER.
vim.o.incsearch = true
vim.o.joinspaces = false
vim.o.keywordprg = ":DD"
vim.o.linebreak = true
vim.o.list = true
vim.opt.listchars = { eol = "¬", tab = "▸ ", trail = "@" }
vim.o.number = true
vim.o.signcolumn = "number"
vim.o.shiftwidth = 2
vim.o.showmode = true
vim.o.smartcase = true
vim.o.softtabstop = 2
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.swapfile = false
vim.o.switchbuf = "useopen"
vim.o.tabstop = 2
vim.o.termguicolors = true
vim.o.wildignorecase = true
vim.o.wildmenu = true
vim.o.wildmode = "list:longest,full"
vim.o.winborder = "rounded"
vim.o.winwidth = 90
vim.o.winminwidth = 40
vim.o.wrap = true

--------------------------------------------------------------------------------
-- cmd {{{1

vim.cmd("command! Bdelete                lexpr [] | lclose | bprevious | bdelete #")
vim.cmd("command! Bnext                  lexpr [] | lclose | bnext")
vim.cmd("command! Bprevious              lexpr [] | lclose | bprevious")
vim.cmd("command! RemoveFancyCharacters  call file#RemoveFancyCharacters()")
vim.cmd("command! RenameFile             call file#RenameFile()")
vim.cmd("command! WipeMarks              delmarks! | delmarks A-Z0-9")
vim.cmd("command! WipeRegisters          for i in range(34,122) | silent! call setreg(nr2char(i), []) | endfor")

--------------------------------------------------------------------------------
-- augroup {{{1

vim.api.nvim_create_augroup("UserFold", { clear = true })
vim.api.nvim_create_augroup("UserHighlight", { clear = true })
vim.api.nvim_create_augroup("UserLint", { clear = true })
vim.api.nvim_create_augroup("UserMisc", { clear = true })
vim.api.nvim_create_augroup("UserQuickfix", { clear = true })
vim.api.nvim_create_augroup("UserStartup", { clear = true })

local user_highlight = vim.api.nvim_create_augroup("UserHighlight", { clear = true })
local function link_whitespace_hl()
  vim.api.nvim_set_hl(0, "UnwantedWhitespace", { link = "WarningMsg" })
  vim.api.nvim_create_autocmd({ "BufEnter", "WinEnter" }, {
    desc = "highlight all tab chars and trailing spaces the red color set by your colorscheme",
    pattern = "*",
    group = user_highlight,
    command = [[
      call clearmatches()
      call matchadd('UnwantedWhitespace', '\t', 100)
      call matchadd('UnwantedWhitespace', '\s\+$', 100)
    ]],
  })
end

local user_quickfix = vim.api.nvim_create_augroup("UserQuickfix", { clear = true })
vim.api.nvim_create_autocmd({ "QuickFixCmdPost" }, {
  desc = "Make quickfix window always occupy the full width.",
  pattern = "[^l]*",
  group = user_quickfix,
  command = "botright cwindow",
})
vim.api.nvim_create_autocmd({ "QuickFixCmdPost" }, {
  desc = "Automatically open location list if there are errors for the current window.",
  pattern = "l*",
  group = user_quickfix,
  command = "lwindow",
})

local user_startup = vim.api.nvim_create_augroup("UserStartup", { clear = true })
vim.api.nvim_create_autocmd({ "VimEnter" }, {
  pattern = "*",
  group = user_startup,
  command = "WipeMarks",
})
vim.api.nvim_create_autocmd({ "VimEnter" }, {
  pattern = "*",
  group = user_startup,
  command = "WipeRegisters",
})

local user_misc = vim.api.nvim_create_augroup("UserMisc", { clear = true })
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  desc = "Remove trailing whitespace before save.",
  pattern = "*",
  group = user_misc,
  command = "%s/\\s\\+$//e",
})
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  desc = "Reload vimrc after save.",
  pattern = vim.env.MYVIMRC,
  group = user_misc,
  command = "source $MYVIMRC",
})

--------------------------------------------------------------------------------
-- keymap {{{1

local key_opts = { noremap = true, silent = true }

vim.keymap.set("n", "J", "mzJ`z", key_opts)
vim.keymap.set("n", "U", "<C-r>", key_opts)
vim.keymap.set("n", "x", '"_x', key_opts)
vim.keymap.set("n", "Y", "y$", key_opts)

vim.keymap.set("n", "<M-9>", ":vertical resize -10<CR>", key_opts)
vim.keymap.set("n", "<M-0>", ":vertical resize +10<CR>", key_opts)

vim.keymap.set("n", "<BS>", "<C-^>", key_opts)
vim.keymap.set("n", "<C-h>", ":Bprevious<CR>", key_opts)
vim.keymap.set("n", "<C-l>", ":Bnext<CR>", key_opts)
vim.keymap.set("n", "<M-k>", ":cprevious<CR>", key_opts)
vim.keymap.set("n", "<M-j>", ":cnext<CR>", key_opts)
vim.keymap.set("n", "<C-k>", ":lprevious<CR>", key_opts)
vim.keymap.set("n", "<C-j>", ":lnext<CR>", key_opts)
vim.keymap.set("n", "<Esc>", ":nohlsearch<CR><Esc>", key_opts)

vim.cmd([[iabbrev <silent> xdd <C-r>=strftime("%FT%T%z, %a")<CR>]])

-- <Space> ---------------------------------------------------------------------

vim.keymap.set("", "<Space>", "<Nop>", key_opts)

vim.keymap.set("n", "<Space>bb", ":ls<CR>:buffer<Space>*", key_opts)
vim.keymap.set("n", "<Space>bs", ":ls<CR>:sbuffer<Space>*", key_opts)
vim.keymap.set("n", "<Space>bv", ":ls<CR>:vertical<Space>sbuffer<Space>*", key_opts)
vim.keymap.set("n", "<Space>bd", ":Bdelete<CR>", key_opts)

vim.keymap.set("n", "<Space>ff", ":set expandtab? fileencoding? fileformat? filetype?<CR>", key_opts)
vim.keymap.set("n", "<Space>fc", ":RemoveFancyCharacters<CR>", key_opts)
vim.keymap.set("n", "<Space>fr", ":RenameFile<CR>", key_opts)
vim.keymap.set("n", "<Space>ft", [[:%s/\s\+$//e<CR>:let @/=''<CR>]], key_opts)
vim.keymap.set("n", "<Space>fw", ":set wrap!<CR>", key_opts)

vim.keymap.set("n", "<Space>vv", ":edit $MYVIMRC<CR>", key_opts)

vim.keymap.set("n", "<Space>tt", ":FZF<CR>", key_opts)
vim.keymap.set("n", "<Space>te", ":FZF ~/", { noremap = true, silent = false })
vim.keymap.set("n", "<Space>tj", ":FZF ~/Dropbox/notes<CR>", key_opts)
vim.keymap.set("n", "<Space>tl", ":edit ~/.ledger/current.journal<CR>zm", key_opts)
vim.keymap.set("n", "<Space>tn", ":FZF ~/Documents/notes<CR>", key_opts)
vim.keymap.set("n", "<Space>to", ":edit ~/Dropbox/todo.txt<CR>", key_opts)
vim.keymap.set("n", "<Space>tf", ":edit ~/Dropbox/notes/someday.markdown<CR>", key_opts)

vim.keymap.set("n", "<Space>l", function()
  local win = vim.api.nvim_get_current_win()
  local qf_winid = vim.fn.getloclist(win, { winid = 0 }).winid
  local action = qf_winid > 0 and "silent! lclose" or "silent! lwindow"
  vim.cmd(action)
end, key_opts)
vim.keymap.set("n", "<Space>q", function()
  local qf_winid = vim.fn.getqflist({ winid = 0 }).winid
  local action = qf_winid > 0 and "silent! cclose" or "silent! botright cwindow"
  vim.cmd(action)
end, key_opts)

--------------------------------------------------------------------------------
-- ui {{{1

vim.pack.add({
  "https://github.com/RRethy/base16-nvim",
  "https://github.com/savq/melange-nvim",
})
vim.cmd("colorscheme base16-eighties")
-- vim.cmd("colorscheme melange")

link_whitespace_hl() -- must be called *after* setting colorscheme

--------------------------------------------------------------------------------
-- }}}1
