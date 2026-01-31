vim.pack.add({
  "https://github.com/mason-org/mason.nvim",
  "https://github.com/nvim-treesitter/nvim-treesitter",
  "https://github.com/windwp/nvim-ts-autotag",
  "https://github.com/justinmk/vim-dirvish",
  "https://github.com/jessekelighine/vindent.nvim",
})

require("mason").setup()

-- vindent.nvim
local vindent = require("vindent")
local block_opts = {
  strict     = { skip_empty_lines = false, skip_more_indented_lines = false },
  contiguous = { skip_empty_lines = false, skip_more_indented_lines = true  },
  loose      = { skip_empty_lines = true,  skip_more_indented_lines = true  },
}
vindent.setup({
  vindent.map.BlockMotion({ prev = "[=", next = "]=" }, block_opts.strict),
  vindent.map.Motion({ prev = "[-", next = "]-" }, "less"),
  vindent.map.Motion({ prev = "[+", next = "]+" }, "more"),
  vindent.map.Object("iI", "ii", block_opts.loose),
  vindent.map.Object("ii", "ii", block_opts.strict),
  vindent.map.Object("ai", "ai", block_opts.loose),
  vindent.map.Object("aI", "aI", block_opts.loose),
})
vim.g.vindent_begin = false

-- note: nvim-treesitter requires tree-sitter-cli to build parsers.
local ts_parsers = {
  "bash",
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
  "zsh",
}
require("nvim-treesitter").install(ts_parsers)
