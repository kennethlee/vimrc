local dependencies = {
  "windwp/nvim-ts-autotag",
}

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

return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  enabled = true,
  lazy = true,
  event = "BufReadPost",
  dependencies = dependencies,
  opts = {
    ensure_installed = parsers,
    highlight = {
      enable = true,
      disable = {},
      additional_vim_regex_highlighting = false,
    },
    indent = { enable = true, },
    -- windwp/nvim-autopairs
    autopairs = { enable = true, },
    -- windwp/nvim-ts-autotag
    autotag = { enable = true, },
  },
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
  end,
}
