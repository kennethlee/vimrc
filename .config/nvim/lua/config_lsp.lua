local lsp = require("lspconfig")
-- local completion = require("completion")

local mapper = function(mode, key, result)
  vim.api.nvim_buf_set_keymap(0, mode, key, "<cmd>lua "..result.."<CR>", {noremap = true, silent = true})
end

local custom_attach = function()
  -- completion.on_attach()

  vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
      signs = true,
      underline = true,
      update_in_insert = false,
      virtual_text = true,
    }
  )

  -- cleaner signcolumn: color line number instead of having signs in the signcolumn
  -- https://www.reddit.com/r/neovim/comments/l00zzb/improve_style_of_builtin_lsp_diagnostic_messages/
  vim.fn.sign_define("LspDiagnosticsSignError", {text = "", numhl = "LspDiagnosticsDefaultError"})
  vim.fn.sign_define("LspDiagnosticsSignWarning", {text = "", numhl = "LspDiagnosticsDefaultWarning"})
  vim.fn.sign_define("LspDiagnosticsSignInformation", {text = "", numhl = "LspDiagnosticsDefaultInformation"})
  vim.fn.sign_define("LspDiagnosticsSignHint", {text = "", numhl = "LspDiagnosticsDefaultHint"})

  -- mappings
  mapper("n", "gn", "vim.lsp.diagnostic.goto_next({enable_popup = false})")
  mapper("n", "gp", "vim.lsp.diagnostic.goto_prev({enable_popup = false})")
  mapper("n", "<Space>gl", "vim.lsp.diagnostic.set_loclist({ open_loclist = true})")
  mapper("n", "<Space>gd", "vim.lsp.buf.definition()")
  mapper("n", "<Space>gi", "vim.lsp.buf.implementation()")
  mapper("n", "<Space>gr", "vim.lsp.buf.references()")

  print("LSP initialized.")
end

lsp.tsserver.setup {
  on_attach = custom_attach
}
