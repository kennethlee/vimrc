return {
  "terrortylor/nvim-comment",
  enabled = true,
  lazy = true,
  cmd = "CommentToggle",
  keys = { "dic", "gc", },
  opts = {
    comment_empty = false,
    marker_padding = true,
  },
  config = function(_, opts)
    require("nvim_comment").setup(opts)
  end,
}
