vim.pack.add({
  "https://github.com/mason-org/mason.nvim",
  "https://github.com/nvim-treesitter/nvim-treesitter",
  "https://github.com/windwp/nvim-ts-autotag",
  "https://github.com/justinmk/vim-dirvish",
  "https://github.com/michaeljsmith/vim-indent-object",
})
require("mason").setup()

-- note: nvim-treesitter requires tree-sitter-cli to build parsers.
local ts_parsers = {
  "cpp",
  "css",
  "html",
  "javascript",
  "json",
  "lua",
  "tsx",
  "typescript",
  "vim",
  "zig",
}
require("nvim-treesitter").install(ts_parsers)
