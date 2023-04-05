-- options {{{1

local cmd = vim.cmd
local o = vim.o
local opt = vim.opt

-- encoding must be set before scriptencoding
o.encoding = "utf-8"
o.modeline = false
o.clipboard = "unnamedplus"
cmd("filetype plugin indent on")
opt.runtimepath = vim.opt.runtimepath + { "~/.fzf" }

if vim.fn.executable("rg") == 1 then
  o.grepprg = "rg --vimgrep --no-heading --hidden --glob '!{.git,node_modules}/*'"
  o.grepformat = "%f:%l:%c:%m,%f:%l:%m"
end

-- enable
-- note for nvim: matchit is on by default
cmd("packadd! matchit")
cmd("packadd! cfilter")

-- disable
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
o.autoindent = true
o.autoread = true
o.backspace = "indent,eol,start"
o.breakindent = true
o.cmdheight = 2
o.cmdwinheight = 20
o.completeopt = "noselect,menuone"
o.cursorcolumn = true
o.expandtab = true
opt.foldopen = vim.opt.foldopen - { "block" }
o.foldtext = "fold#HeaderText()"
o.hidden = true
o.hlsearch = true
o.ignorecase = true
o.inccommand = "nosplit"
-- when incsearch is set, entering a search pattern for / or ? and the current
-- match is displayed, CTRL-G will move to the next match, and CTRL-T will move
-- to the previous match, without pressing ENTER.
o.incsearch = true
o.keywordprg = ":DD"
o.linebreak = true
o.list = true
opt.listchars = { eol = "¬", tab = "▸ ", trail = "@" }
o.backup = false
o.equalalways = false
o.foldenable = false
o.joinspaces = false
o.swapfile = false
o.number = true
o.signcolumn = "number"
o.shiftwidth = 2
o.showmode = true
o.smartcase = true
o.softtabstop = 2
o.splitbelow = true
o.splitright = true
o.switchbuf = "useopen"
o.tabstop = 2
o.termguicolors = true
o.wildignorecase = true
o.wildmenu = true
o.wildmode = "list:longest,full"
o.winwidth = 90
o.winminwidth = 40
o.wrap = true

--------------------------------------------------------------------------------
-- commands {{{1

cmd("command! Bdelete                lexpr [] | lclose | bprevious | bdelete #")
cmd("command! Bnext                  lexpr [] | lclose | bnext")
cmd("command! Bprevious              lexpr [] | lclose | bprevious")
cmd("command! Chreg                  call macro#ChangeRegister()")
cmd("command! RemoveFancyCharacters  call file#RemoveFancyCharacters()")
cmd("command! RenameFile             call file#RenameFile()")
cmd("command! ToggleLocationList     call window#ToggleLocationList()")
cmd("command! ToggleQuickfixList     call window#ToggleQuickfixList()")
cmd("command! WipeMarks              delmarks! | delmarks A-Z0-9")
cmd("command! WipeRegisters          for i in range(34,122) | silent! call setreg(nr2char(i), []) | endfor")

--------------------------------------------------------------------------------
-- augroups {{{1

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

--------------------------------------------------------------------------------
-- ui {{{1

cmd("packadd! nvim-base16")
cmd("colorscheme base16-eighties")

-- link highlight of whitespace to WarningMsg (i.e. red)
-- note: this must be set below colorscheme.
vim.api.nvim_set_hl(0, "UnwantedWhitespace", { link = "WarningMsg" })
autocmd({ "BufEnter", "WinEnter" }, {
  pattern = "*",
  group = "UserHighlight",
  command = [[
    call clearmatches()
    call matchadd('UnwantedWhitespace', '\t', 100)
    call matchadd('UnwantedWhitespace', '\s\+$', 100)
  ]],
  desc = "highlight all tab chars and trailing spaces the red color set by your colorscheme",
})

local stl = {
  "%#error#",      -- error highlight group begin
  "%m",            -- modified flag
  "%*",            -- error highlight group end
  "%<",            -- truncation point
  "%f",            -- filepath
  "%=",            -- separator
  "%{v:register}", -- display current register
  "%-18",          -- padding right, 18 char width
  "(%l,%c%V%)",    -- current {line #},{column #}-{virtual column #}
}

o.statusline = table.concat(stl)

--------------------------------------------------------------------------------
-- keymap: general {{{1

local set = vim.keymap.set
local key_opts = { noremap = true, silent = true }

set("n", "J", "mzJ`z", key_opts)
set("n", "U", "<C-r>", key_opts)
set("n", "x", '"_x', key_opts)
set("n", "Y", "y$", key_opts)

set("n", "_", ":call textobject#NextIndent(0, 0, 0, 1)<CR>", key_opts)
set("o", "_", ":call textobject#NextIndent(0, 0, 0, 1)<CR>", key_opts)
set("v", "_", "<Esc>:call textobject#NextIndent(0, 0, 0, 1)<CR>m'gv''", key_opts)
set("n", "+", ":call textobject#NextIndent(0, 1, 0, 1)<CR>", key_opts)
set("o", "+", ":call textobject#NextIndent(0, 1, 0, 1)<CR>", key_opts)
set("v", "+", "<Esc>:call textobject#NextIndent(0, 1, 0, 1)<CR>m'gv''", key_opts)

set("n", "<M-9>", ":vertical resize -10<CR>", key_opts)
set("n", "<M-0>", ":vertical resize +10<CR>", key_opts)

set("n", "<BS>", "<C-^>", key_opts)
set("n", "<C-h>", ":Bprevious<CR>", key_opts)
set("n", "<C-l>", ":Bnext<CR>", key_opts)
set("n", "<M-k>", ":cprevious<CR>", key_opts)
set("n", "<M-j>", ":cnext<CR>", key_opts)
set("n", "<C-k>", ":lprevious<CR>", key_opts)
set("n", "<C-j>", ":lnext<CR>", key_opts)

set("n", "<Esc>", ":nohlsearch<CR><Esc>", key_opts)
set("i", "<Tab>", "key#InsertTabWrapper()", { expr = true, noremap = true, silent = true })
set("i", "<S-Tab>", "<C-n>", key_opts)

cmd([[iabbrev <silent> xdd <C-r>=strftime("%FT%T%z, %a")<CR>]])

--------------------------------------------------------------------------------
-- keymap: <Space> {{{1

set("", "<Space>", "<Nop>", key_opts)

set("n", "<Space>bb", ":ls<CR>:buffer<Space>*", key_opts)
set("n", "<Space>bs", ":ls<CR>:sbuffer<Space>*", key_opts)
set("n", "<Space>bv", ":ls<CR>:vertical<Space>sbuffer<Space>*", key_opts)
set("n", "<Space>bd", ":Bdelete<CR>", key_opts)

set("n", "<Space>ff", ":set expandtab? fileencoding? fileformat? filetype?<CR>", key_opts)
set("n", "<Space>fc", ":RemoveFancyCharacters<CR>", key_opts)
set("n", "<Space>fp", ":%!prettier --stdin --stdin-filepath % --trailing-comma all<CR>", key_opts)
set("n", "<Space>fr", ":RenameFile<CR>", key_opts)
set("n", "<Space>ft", [[:%s/\s\+$//e<CR>:let @/=''<CR>]], key_opts)
set("n", "<Space>fw", ":set wrap!<CR>", key_opts)

set("n", "<Space>vv", ":edit $MYVIMRC<CR>", key_opts)
set("n", "<Space>o", ":edit ~/Dropbox/Apps/todo/todo.txt<CR>", key_opts)
set("n", "<Space>tt", ":FZF<CR>", key_opts)
set("n", "<Space>te", ":FZF ~/", key_opts)
set("n", "<Space>tj", ":FZF ~/Dropbox/notes<CR>", key_opts)
set("n", "<Space>tl", ":edit ~/.ledger/current.journal<CR>zm", key_opts)
set("n", "<Space>tn", ":FZF ~/Documents/notes<CR>", key_opts)

set("n", "<Space>q", ":ToggleQuickfixList<CR>", key_opts)
set("n", "<Space>l", ":ToggleLocationList<CR>", key_opts)

--------------------------------------------------------------------------------
-- }}}1
