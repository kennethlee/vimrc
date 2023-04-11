return {
  "windwp/nvim-autopairs",
  enabled = true,
  lazy = true,
  event = "InsertEnter",
  opts = {
    disable_filetype = {
      "",
      "markdown",
      "text",
    },
  },
}
