return {
  "numToStr/Comment.nvim",
  enabled = true,
  lazy = true,
  keys = {
    {
      "gb",
      mode = { "n", "o", "x", },
    },
    {
      "gc",
      mode = { "n", "o", "x", },
    },
  },
  opts = {},
  config = function(_, opts)
    require("Comment").setup(opts)
  end,
}
