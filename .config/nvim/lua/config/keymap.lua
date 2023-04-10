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
set("i", "<Tab>", "key#InsertTabWrapper()", {expr = true, noremap = true, silent = true})
set("i", "<S-Tab>", [[pumvisible()?"\<C-p>":"\<C-d>"]], {expr = true, noremap = true, silent = true})

vim.cmd([[iabbrev <silent> xdd <C-r>=strftime("%FT%T%z, %a")<CR>]])

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
