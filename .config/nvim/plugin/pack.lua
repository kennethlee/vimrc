-- vim.pack {{{1

vim.pack.add({
  "https://github.com/stevearc/oil.nvim",
  "https://github.com/nvim-lualine/lualine.nvim",
  "https://github.com/nvim-tree/nvim-web-devicons",
  "https://github.com/jessekelighine/vindent.nvim",
  "https://github.com/nvim-treesitter/nvim-treesitter",
  "https://github.com/mason-org/mason.nvim",
})

-- These don't require further configuration.
require("mason").setup()

--------------------------------------------------------------------------------
-- oil.nvim {{{1

require("oil").setup({
  default_file_explorer = true,
  -- :h oil-trash
  delete_to_trash = true,
  watch_for_changes = true,
  view_options = {
    case_insensitive = true,
    show_hidden = true,
  },
  vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
})

--------------------------------------------------------------------------------
-- lualine.nvim {{{1

require("lualine").setup({
  options = {
    refresh = {
      statusline = 100,
    },
    -- removing component_separators looks MUCH better.
    component_separators = "",
    -- section_separators = { left = "", right = "" },
  },
  sections = {
    lualine_a = {
    },
    lualine_b = {
      {"branch"},
      {"diff"},
      {"lsp_status"},
      {"diagnostics"},
    },
    lualine_c = {{"filename", path = 3}},
    lualine_x = {
      {"encoding"},
      {"fileformat"},
      {"filetype"},
    },
    lualine_y = {"progress", "location"},
    lualine_z = {},
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {{"filename", path = 3}},
    lualine_x = {"location"},
    lualine_y = {},
    lualine_z = {},
  },
})

--------------------------------------------------------------------------------
-- vindent.nvim {{{1

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

--------------------------------------------------------------------------------
-- nvim-treesitter {{{1

-- note: nvim-treesitter requires tree-sitter-cli to build parsers.
local ts_parsers = {
  "bash",
  "cpp",
  "css",
  "html",
  "javascript",
  "json",
  "lua",
  "markdown",
  "markdown_inline",
  "tsx",
  "typescript",
  "vim",
  "zig",
  "zsh",
}
require("nvim-treesitter").install(ts_parsers)

--------------------------------------------------------------------------------
-- }}}1
