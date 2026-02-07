vim.pack.add({"https://github.com/nvim-lualine/lualine.nvim"})

require("lualine").setup({
  options = {
    refresh = {
      statusline = 100,
    },
    component_separators = "",
    section_separators = "",
    -- section_separators = { left = "", right = "" },
    always_show_tabline = false,
  },

  sections = {
    lualine_a = {},
    lualine_b = {
      {
        "branch",
        icon = "",
      },
      {
        "diff",
        padding = {
          left = 0,
          right = 1,
        },
        -- separator = "|",
        symbols = {
          added = "",
          modified = "",
          removed = "",
        },
      },
      {"lsp_status"},
      {
        "diagnostics",
        padding = {
          left = 0,
          right = 1,
        },
        symbols = {
          error = "",
          warn = "",
          info = "",
          hint = "",
        },
      },
    },
    lualine_c = {
      {"filename", path = 3},
    },
    lualine_x = {
      {"encoding"},
      {"fileformat"},
      {"filetype"},
    },
    lualine_y = {
      {"progress"},
      {"location"},
    },
    lualine_z = {},
  },

  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {
      {"filename", path = 3},
    },
    lualine_x = {"location"},
    lualine_y = {},
    lualine_z = {},
  },

  tabline = {},
  extensions = {},
})
