-- options {{{1

local cmd = vim.cmd
local opt = vim.opt

-- encoding must be set before scriptencoding
opt.encoding = "utf-8"
-- scriptencoding utf-8
opt.modeline = false
opt.clipboard = "unnamedplus"
cmd([[filetype indent off]])
cmd([[filetype plugin on]])
opt.runtimepath = vim.opt.runtimepath + {"~/.fzf"}

if vim.fn.executable("rg") then
  opt.grepprg = "rg --vimgrep --no-heading --hidden --glob '!{.git,node_modules}/*'"
  opt.grepformat = "%f:%l:%c:%m,%f:%l:%m"
end

-- enable
-- note for nvim: matchit is on by default
cmd([[packadd! matchit]])
cmd([[packadd! cfilter]])

-- disable
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

opt.autoindent = true
opt.autoread = true
opt.backspace = "indent,eol,start"
opt.breakindent = true
opt.cmdheight = 2
opt.cmdwinheight = 20
opt.completeopt = "noselect,menuone"
opt.cursorcolumn = true
opt.expandtab = true
opt.foldmethod = "manual"
opt.foldnestmax = 5
opt.foldopen = vim.opt.foldopen - {"block"}
opt.foldtext = "fold#HeaderText()"
opt.hidden = true
opt.hlsearch = true
opt.ignorecase = true
opt.inccommand = "nosplit"
-- when incsearch is set, entering a search pattern for / or ? and the current
-- match is displayed, CTRL-G will move to the next match, and CTRL-T will move
-- to the previous match, without pressing ENTER.
opt.incsearch = true
opt.keywordprg = ":DD"
opt.linebreak = true
opt.list = true
opt.listchars = {eol = "¬", tab = "▸ ", trail = "@"}
opt.backup = false
opt.equalalways = false
opt.foldenable = false
opt.joinspaces = false
opt.swapfile = false
opt.number = true
opt.signcolumn = "number"
opt.shiftwidth = 2
opt.showmode = true
opt.smartcase = true
opt.softtabstop = 2
opt.splitbelow = true
opt.splitright = true
opt.switchbuf = "useopen"
opt.tabstop = 2
opt.termguicolors = true
opt.wildignorecase = true
opt.wildmenu = true
opt.wildmode = "list:longest,full"
opt.winwidth = 90
opt.winminwidth = 40
opt.wrap = true

--------------------------------------------------------------------------------
-- require {{{1

require("lsp")
require("pluginconfig")
require("treesitter")

--------------------------------------------------------------------------------
-- commands {{{1

cmd([[command! Bdelete                lexpr [] | lclose | bprevious | bdelete #]])
cmd([[command! Bnext                  lexpr [] | lclose | bnext]])
cmd([[command! Bprevious              lexpr [] | lclose | bprevious]])
cmd([[command! Chreg                  call macro#ChangeRegister()]])
cmd([[command! RemoveFancyCharacters  call file#RemoveFancyCharacters()]])
cmd([[command! RenameFile             call file#RenameFile()]])
cmd([[command! ToggleLocationList     call window#ToggleLocationList()]])
cmd([[command! ToggleQuickfixList     call window#ToggleQuickfixList()]])
cmd([[command! WipeMarks              delmarks! | delmarks A-Z0-9]])
cmd([[command! WipeRegisters          for i in range(34,122) | silent! call setreg(nr2char(i), []) | endfor]])

--------------------------------------------------------------------------------
-- augroups {{{1

cmd([[
  augroup User_Fold
    autocmd!
  augroup END
]])

cmd([[
  augroup User_Highlight
    autocmd!
  augroup END
]])

cmd([[
  augroup User_Lint
    autocmd!
  augroup END
]])

cmd([[
  augroup User_Misc
    autocmd!
    autocmd User_Misc BufWritePre * %s/\s\+$//e
    autocmd User_Misc BufWritePost $MYVIMRC nested source $MYVIMRC
  augroup END
]])

cmd([[
  augroup User_Quickfix
    autocmd!
    autocmd User_Quickfix QuickFixCmdPost [^l]* botright cwindow
    autocmd User_Quickfix QuickFixCmdPost l* lwindow
  augroup END
]])

cmd([[
  augroup User_Startup
    autocmd!
    autocmd User_Startup VimEnter * WipeMarks
    autocmd User_Startup VimEnter * WipeRegisters
  augroup END
]])

--------------------------------------------------------------------------------
-- display {{{1

-- cmd([[packadd! gruvbox-flat.nvim]])
-- cmd([[colorscheme gruvbox-flat]])

cmd([[packadd! melange]])
cmd([[colorscheme melange]])

-- cmd([[packadd! nofrils]])
-- cmd([[colorscheme nofrils-acme]])
-- cmd([[colorscheme nofrils-dark]])
-- cmd([[colorscheme nofrils-light]])
-- cmd([[colorscheme nofrils-sepia]])

-- cmd([[packadd! nvim-base16]])
-- cmd([[colorscheme base16-eighties]])

local stl = {
  "%#error#", -- error highlight group begin
  "%m", -- modified flag
  "%*", -- error highlight group end
  "%<", -- truncation point
  "%f", -- filepath
  "%=", -- separator
  "%{v:register}", -- display current register
  "%-18", -- padding right, 18 char width
  "(%l,%c%V%)", -- current {line #},{column #}-{virtual column #}
}

opt.statusline = table.concat(stl)

--------------------------------------------------------------------------------
-- keymap: general {{{1

local keymap = vim.keymap.set
local key_opts = { noremap = true, silent = true }

keymap("n", "J", "mzJ`z", key_opts)
keymap("n", "U", "<C-r>", key_opts)
keymap("n", "x", '"_x', key_opts)
keymap("n", "Y", "y$", key_opts)

keymap("n", "_", ":call textobject#NextIndent(0, 0, 0, 1)<CR>", key_opts)
keymap("o", "_", ":call textobject#NextIndent(0, 0, 0, 1)<CR>", key_opts)
keymap("v", "_", "<Esc>:call textobject#NextIndent(0, 0, 0, 1)<CR>m'gv''", key_opts)
keymap("n", "+", ":call textobject#NextIndent(0, 1, 0, 1)<CR>", key_opts)
keymap("o", "+", ":call textobject#NextIndent(0, 1, 0, 1)<CR>", key_opts)
keymap("v", "+", "<Esc>:call textobject#NextIndent(0, 1, 0, 1)<CR>m'gv''", key_opts)

keymap("n", "<M-9>", ":vertical resize -10<CR>", key_opts)
keymap("n", "<M-0>", ":vertical resize +10<CR>", key_opts)

keymap("n", "<BS>", "<C-^>", key_opts)
keymap("n", "<C-h>", ":Bprevious<CR>", key_opts)
keymap("n", "<C-l>", ":Bnext<CR>", key_opts)
keymap("n", "<M-k>", ":cprevious<CR>", key_opts)
keymap("n", "<M-j>", ":cnext<CR>", key_opts)
keymap("n", "<C-k>", ":lprevious<CR>", key_opts)
keymap("n", "<C-j>", ":lnext<CR>", key_opts)

keymap("n", "<Esc>", ":nohlsearch<CR><Esc>", key_opts)
keymap("i", "<Tab>", "key#InsertTabWrapper()", { expr = true, noremap = true, silent = true })
keymap("i", "<S-Tab>", "<C-n>", key_opts)

cmd([[iabbrev <silent> xdd <C-r>=strftime("%FT%T%z, %a")<CR>]])

--------------------------------------------------------------------------------
-- keymap: <Space> {{{1

keymap("", "<Space>", "<Nop>", key_opts)

keymap("n", "<Space>bb", ":ls<CR>:buffer<Space>*", key_opts)
keymap("n", "<Space>bs", ":ls<CR>:sbuffer<Space>*", key_opts)
keymap("n", "<Space>bv", ":ls<CR>:vertical<Space>sbuffer<Space>*", key_opts)
keymap("n", "<Space>bd", ":Bdelete<CR>", key_opts)

keymap("n", "<Space>ff", ":set expandtab? fileencoding? fileformat? filetype?<CR>", key_opts)
keymap("n", "<Space>fc", ":RemoveFancyCharacters<CR>", key_opts)
keymap("n", "<Space>fp", ":%!prettier --stdin --stdin-filepath % --trailing-comma all<CR>", key_opts)
keymap("n", "<Space>fr", ":RenameFile<CR>", key_opts)
keymap("n", "<Space>ft", [[:%s/\s\+$//e<CR>:let @/=''<CR>]], key_opts)
keymap("n", "<Space>fw", ":set wrap!<CR>", key_opts)

keymap("n", "<Space>vv", ":edit $MYVIMRC<CR>", key_opts)
keymap("n", "<Space>o", ":edit ~/Dropbox/Apps/todo/todo.txt<CR>", key_opts)
keymap("n", "<Space>tt", ":FZF<CR>", key_opts)
keymap("n", "<Space>te", ":FZF ~/", key_opts)
keymap("n", "<Space>tj", ":FZF ~/Dropbox/notes<CR>", key_opts)
keymap("n", "<Space>tl", ":edit ~/.ledger/current.journal<CR>zm", key_opts)
keymap("n", "<Space>tn", ":FZF ~/Documents/notes<CR>", key_opts)

keymap("n", "<Space>q", ":ToggleQuickfixList<CR>", key_opts)
keymap("n", "<Space>l", ":ToggleLocationList<CR>", key_opts)

--------------------------------------------------------------------------------
-- }}}1
