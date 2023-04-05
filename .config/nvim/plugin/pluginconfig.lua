-- williamboman/mason.nvim
require("mason").setup({})

-- windwp/nvim-autopairs
require("nvim-autopairs").setup({
  disable_filetype = {
    "markdown",
    "text",
  },
})

-- terrortylor/nvim-comment
require("nvim_comment").setup({
  comment_empty = false,
  marker_padding = true,
})

require("nvim-treesitter.configs").setup({
  -- windwp/nvim-ts-autotag
  autotag = {
    enable = true,
  },
  -- JoosepAlviste/nvim-ts-context-commentstring
  context_commentstring = {
    enable = true,
    config = {
      javascript = {
        __default = "// %s",
        jsx_element = "{/* %s */}",
        jsx_fragment = "{/* %s */}",
        jsx_attribute = "// %s",
        comment = "// %s",
      },
    },
  },
})
