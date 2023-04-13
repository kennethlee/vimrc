return {
  "williamboman/mason.nvim",
  build = ":MasonUpdate",
  enabled = true,
  lazy = false,
  opts = {},
  config = function(_, opts)
    require("mason").setup(opts)
  end,
}
