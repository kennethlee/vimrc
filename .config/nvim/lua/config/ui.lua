-- cmd("packadd! nvim-base16")
-- cmd("colorscheme base16-eighties")

-- link highlight of whitespace to WarningMsg (i.e. red)
-- note 1: this must be set below colorscheme.
-- note 2: currently unused here because of lazy.nvim.
vim.api.nvim_set_hl(0, "UnwantedWhitespace", { link = "WarningMsg" })
vim.api.nvim_create_autocmd({ "BufEnter", "WinEnter" }, {
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

vim.o.statusline = table.concat(stl)
