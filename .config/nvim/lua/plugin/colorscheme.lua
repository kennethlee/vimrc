return {
  {
    "RRethy/nvim-base16",
    enabled = true,
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd("colorscheme base16-eighties")
    end,
  },
}
