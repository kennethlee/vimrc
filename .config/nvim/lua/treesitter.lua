require("nvim-treesitter.configs").setup({
  ensure_installed = {"css", "html", "javascript", "json", "lua", "tsx", "typescript"},
  ignore_install = {},
  highlight = {
    enable = true,
    disable = {},
  },
})
