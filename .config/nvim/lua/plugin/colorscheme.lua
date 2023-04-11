local function link_whitespace_hl()
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
end

return {
  {
    "RRethy/nvim-base16",
    enabled = true,
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd("colorscheme base16-eighties")
      link_whitespace_hl()
    end,
  },
}
