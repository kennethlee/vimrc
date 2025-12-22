-- `tree-sitter-cli` is required to build parsers.

local parsers = {
  "cpp",
  "css",
  "html",
  "javascript",
  "json",
  "lua",
  "tsx",
  "typescript",
  "vim",
}

require("nvim-treesitter").install(parsers)
