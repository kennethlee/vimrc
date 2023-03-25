-- options {{{1

-- encoding must be set before scriptencoding
vim.opt.encoding = "utf-8"
-- scriptencoding utf-8
vim.opt.modeline = false
vim.opt.clipboard = "unnamedplus"
vim.cmd([[filetype indent off]])
vim.cmd([[filetype plugin on]])
vim.opt.runtimepath = vim.opt.runtimepath + {"~/.fzf"}

if vim.fn.executable("rg") then
  vim.opt.grepprg = "rg --vimgrep --no-heading --hidden --glob '!{.git,node_modules}/*'"
  vim.opt.grepformat = "%f:%l:%c:%m,%f:%l:%m"
end

-- enable
-- note for nvim: matchit is on by default
vim.cmd([[packadd! matchit]])
vim.cmd([[packadd! cfilter]])

-- disable
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.autoindent = true
vim.opt.autoread = true
vim.opt.backspace = "indent,eol,start"
vim.opt.breakindent = true
vim.opt.cmdheight = 0
vim.opt.cmdwinheight = 20
vim.opt.completeopt = "noselect,menuone"
vim.opt.cursorcolumn = true
vim.opt.expandtab = true
vim.opt.foldmethod = "manual"
vim.opt.foldnestmax = 5
vim.opt.foldopen = vim.opt.foldopen - {"block"}
vim.opt.foldtext = "fold#HeaderText()"
vim.opt.hidden = true
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.inccommand = "nosplit"
-- when incsearch is set, entering a search pattern for / or ? and the current
-- match is displayed, CTRL-G will move to the next match, and CTRL-T will move
-- to the previous match, without pressing ENTER.
vim.opt.incsearch = true
vim.opt.keywordprg = ":DD"
vim.opt.linebreak = true
vim.opt.list = true
vim.opt.listchars = {eol = "¬", tab = "▸ ", trail = "@"}
vim.opt.backup = false
vim.opt.equalalways = false
vim.opt.foldenable = false
vim.opt.joinspaces = false
vim.opt.swapfile = false
vim.opt.number = true
vim.opt.signcolumn = "number"
vim.opt.shiftwidth = 2
vim.opt.showmode = true
vim.opt.smartcase = true
vim.opt.softtabstop = 2
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.switchbuf = "useopen"
vim.opt.tabstop = 2
vim.opt.termguicolors = true
vim.opt.wildignorecase = true
vim.opt.wildmenu = true
vim.opt.wildmode = "list:longest,full"
vim.opt.winwidth = 90
vim.opt.winminwidth = 40
vim.opt.wrap = true

--------------------------------------------------------------------------------
-- require {{{1

require("lsp")
require("pluginconfig")
require("treesitter")

--------------------------------------------------------------------------------
-- commands {{{1

vim.cmd([[command! Bdelete                lexpr [] | lclose | bprevious | bdelete #]])
vim.cmd([[command! Bnext                  lexpr [] | lclose | bnext]])
vim.cmd([[command! Bprevious              lexpr [] | lclose | bprevious]])
vim.cmd([[command! Chreg                  call macro#ChangeRegister()]])
vim.cmd([[command! RemoveFancyCharacters  call file#RemoveFancyCharacters()]])
vim.cmd([[command! RenameFile             call file#RenameFile()]])
vim.cmd([[command! ToggleLocationList     call window#ToggleLocationList()]])
vim.cmd([[command! ToggleQuickfixList     call window#ToggleQuickfixList()]])
vim.cmd([[command! WipeMarks              delmarks! | delmarks A-Z0-9]])
vim.cmd([[command! WipeRegisters          for i in range(34,122) | silent! call setreg(nr2char(i), []) | endfor]])

--------------------------------------------------------------------------------
-- augroups {{{1

vim.cmd([[
  augroup User_Fold
    autocmd!
  augroup END
]])

vim.cmd([[
  augroup User_Highlight
    autocmd!
  augroup END
]])

vim.cmd([[
  augroup User_Lint
    autocmd!
  augroup END
]])

vim.cmd([[
  augroup User_Misc
    autocmd!
    autocmd User_Misc BufWritePre * %s/\s\+$//e
    autocmd User_Misc BufWritePost $MYVIMRC nested source $MYVIMRC
  augroup END
]])

vim.cmd([[
  augroup User_Quickfix
    autocmd!
    autocmd User_Quickfix QuickFixCmdPost [^l]* botright cwindow
    autocmd User_Quickfix QuickFixCmdPost l* lwindow
  augroup END
]])

vim.cmd([[
  augroup User_Startup
    autocmd!
    autocmd User_Startup VimEnter * WipeMarks
    autocmd User_Startup VimEnter * WipeRegisters
  augroup END
]])

--------------------------------------------------------------------------------
-- display {{{1

-- vim.cmd([[packadd! gruvbox-flat.nvim]])
-- vim.cmd([[colorscheme gruvbox-flat]])

vim.cmd([[packadd! melange]])
vim.cmd([[colorscheme melange]])

-- vim.cmd([[packadd! nofrils]])
-- vim.cmd([[colorscheme nofrils-acme]])
-- vim.cmd([[colorscheme nofrils-dark]])
-- vim.cmd([[colorscheme nofrils-light]])
-- vim.cmd([[colorscheme nofrils-sepia]])

-- vim.cmd([[packadd! nvim-base16]])
-- vim.cmd([[colorscheme base16-eighties]])

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

vim.opt.statusline = table.concat(stl)

--------------------------------------------------------------------------------
-- keymap: general {{{1

vim.keymap.set("n", "J", "mzJ`z", {noremap = true, silent = true})
vim.keymap.set("n", "U", "<C-r>", {noremap = true, silent = true})
vim.keymap.set("n", "x", '"_x', {noremap = true, silent = true})
vim.keymap.set("n", "Y", "y$", {noremap = true, silent = true})

vim.keymap.set("n", "_", ":call textobject#NextIndent(0, 0, 0, 1)<CR>", {noremap = true, silent = true})
vim.keymap.set("o", "_", ":call textobject#NextIndent(0, 0, 0, 1)<CR>", {noremap = true, silent = true})
vim.keymap.set("v", "_", "<Esc>:call textobject#NextIndent(0, 0, 0, 1)<CR>m'gv''", {noremap = true, silent = true})
vim.keymap.set("n", "+", ":call textobject#NextIndent(0, 1, 0, 1)<CR>", {noremap = true, silent = true})
vim.keymap.set("o", "+", ":call textobject#NextIndent(0, 1, 0, 1)<CR>", {noremap = true, silent = true})
vim.keymap.set("v", "+", "<Esc>:call textobject#NextIndent(0, 1, 0, 1)<CR>m'gv''", {noremap = true, silent = true})

vim.keymap.set("n", "<M-9>", ":vertical resize -10<CR>", {noremap = true, silent = true})
vim.keymap.set("n", "<M-0>", ":vertical resize +10<CR>", {noremap = true, silent = true})

vim.keymap.set("n", "<BS>", "<C-^>", {noremap = true, silent = true})
vim.keymap.set("n", "<C-h>", ":Bprevious<CR>", {noremap = true, silent = true})
vim.keymap.set("n", "<C-l>", ":Bnext<CR>", {noremap = true, silent = true})
vim.keymap.set("n", "<M-k>", ":cprevious<CR>", {noremap = true, silent = true})
vim.keymap.set("n", "<M-j>", ":cnext<CR>", {noremap = true, silent = true})
vim.keymap.set("n", "<C-k>", ":lprevious<CR>", {noremap = true, silent = true})
vim.keymap.set("n", "<C-j>", ":lnext<CR>", {noremap = true, silent = true})

vim.keymap.set("n", "<Esc>", ":nohlsearch<CR><Esc>", {noremap = true, silent = true})
vim.keymap.set("i", "<Tab>", "key#InsertTabWrapper()", {expr = true, noremap = true, silent = true})
vim.keymap.set("i", "<S-Tab>", "<C-n>", {noremap = true, silent = true})

vim.cmd([[iabbrev <silent> xdd <C-r>=strftime("%FT%T%z, %a")<CR>]])

--------------------------------------------------------------------------------
-- keymap: <Space> {{{1

vim.keymap.set("", "<Space>", "<Nop>", {noremap = true, silent = true})

vim.keymap.set("n", "<Space>bb", ":ls<CR>:buffer<Space>*", {noremap = true, silent = true})
vim.keymap.set("n", "<Space>bs", ":ls<CR>:sbuffer<Space>*", {noremap = true, silent = true})
vim.keymap.set("n", "<Space>bv", ":ls<CR>:vertical<Space>sbuffer<Space>*", {noremap = true, silent = true})
vim.keymap.set("n", "<Space>bd", ":Bdelete<CR>", {noremap = true, silent = true})

vim.keymap.set("n", "<Space>ff", ":set expandtab? fileencoding? fileformat? filetype?<CR>", {noremap = true, silent = true})
vim.keymap.set("n", "<Space>fc", ":RemoveFancyCharacters<CR>", {noremap = true, silent = false})
vim.keymap.set("n", "<Space>fp", ":%!prettier --stdin --stdin-filepath % --trailing-comma all<CR>", {noremap = true, silent = true})
vim.keymap.set("n", "<Space>fr", ":RenameFile<CR>", {noremap = true, silent = true})
vim.keymap.set("n", "<Space>ft", [[:%s/\s\+$//e<CR>:let @/=''<CR>]], {noremap = true, silent = true})
vim.keymap.set("n", "<Space>fw", ":set wrap!<CR>", {noremap = true, silent = true})

vim.keymap.set("n", "<Space>vv", ":edit $MYVIMRC<CR>", {noremap = true, silent = true})
vim.keymap.set("n", "<Space>o", ":edit ~/Dropbox/Apps/todo/todo.txt<CR>", {noremap = true, silent = true})
vim.keymap.set("n", "<Space>tt", ":FZF<CR>", {noremap = true, silent = true})
vim.keymap.set("n", "<Space>te", ":FZF ~/", {noremap = true, silent = false})
vim.keymap.set("n", "<Space>tj", ":FZF ~/Dropbox/notes<CR>", {noremap = true, silent = true})
vim.keymap.set("n", "<Space>tl", ":edit ~/.ledger/current.journal<CR>zm", {noremap = true, silent = true})
vim.keymap.set("n", "<Space>tn", ":FZF ~/Documents/notes<CR>", {noremap = true, silent = true})

vim.keymap.set("n", "<Space>q", ":ToggleQuickfixList<CR>", {noremap = true, silent = true})
vim.keymap.set("n", "<Space>l", ":ToggleLocationList<CR>", {noremap = true, silent = true})

--------------------------------------------------------------------------------
-- }}}1
