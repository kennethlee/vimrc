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

-- `tree-sitter-cli` is required to build parsers.
require("nvim-treesitter").install(parsers)
