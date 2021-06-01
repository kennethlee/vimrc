-- terrortylor/nvim-comment
require "nvim_comment".setup({
  comment_empty = false,
  marker_padding = true,
})

-- windwp/nvim-ts-autotag
require "nvim-treesitter.configs".setup({
  autotag = {
    enable = true,
  }
})

-- JoosepAlviste/nvim-ts-context-commentstring
require "nvim-treesitter.configs".setup({
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
  }
})

-- steelsojka/pears.nvim
require "pears".setup()
