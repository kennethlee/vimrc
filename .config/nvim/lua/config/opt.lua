-- encoding must be set before scriptencoding
vim.o.encoding = "utf-8"
vim.o.modeline = false
vim.o.clipboard = "unnamedplus"
vim.cmd("filetype plugin indent on")
-- note: fzf now installed via brew.
vim.opt.runtimepath:append("/usr/local/opt/fzf")

if vim.fn.executable("rg") == 1 then
  vim.o.grepprg = "rg --vimgrep --no-heading --hidden --glob '!{.git,node_modules}/*'"
  vim.o.grepformat = "%f:%l:%c:%m,%f:%l:%m"
end

vim.cmd("packadd cfilter")

-- disable
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.o.autoindent = true
vim.o.autoread = true
vim.o.backspace = "indent,eol,start"
vim.o.breakindent = true
vim.o.cmdheight = 2
vim.o.cmdwinheight = 20
vim.o.completeopt = "noselect,menuone"
vim.o.cursorcolumn = true
vim.o.expandtab = true
vim.opt.foldopen = vim.opt.foldopen - { "block" }
vim.o.foldtext = "fold#HeaderText()"
vim.o.hidden = true
vim.o.hlsearch = true
vim.o.ignorecase = true
vim.o.inccommand = "nosplit"
-- when incsearch is set, entering a search pattern for / or ? and the current
-- match is displayed, CTRL-G will move to the next match, and CTRL-T will move
-- to the previous match, without pressing ENTER.
vim.o.incsearch = true
vim.o.keywordprg = ":DD"
vim.o.linebreak = true
vim.o.list = true
vim.opt.listchars = { eol = "¬", tab = "▸ ", trail = "@" }
vim.o.backup = false
vim.o.equalalways = false
vim.o.foldenable = false
vim.o.joinspaces = false
vim.o.swapfile = false
vim.o.number = true
vim.o.signcolumn = "number"
vim.o.shiftwidth = 2
vim.o.showmode = true
vim.o.smartcase = true
vim.o.softtabstop = 2
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.switchbuf = "useopen"
vim.o.tabstop = 2
vim.o.termguicolors = true
vim.o.wildignorecase = true
vim.o.wildmenu = true
vim.o.wildmode = "list:longest,full"
vim.o.winwidth = 90
vim.o.winminwidth = 40
vim.o.wrap = true
