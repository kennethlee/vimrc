-- williamboman/mason.nvim
require("mason").setup()

-- mfussenegger/nvim-lsp-compl
local autocmd = vim.api.nvim_create_autocmd
local lsp_compl = require("lsp_compl")
autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    local bufnr = args.buf
    lsp_compl.attach(client, bufnr, { server_side_fuzzy_completion = true })
  end,
})

-- ray-x/lsp_signature.nvim
require("lsp_signature").setup({})

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
