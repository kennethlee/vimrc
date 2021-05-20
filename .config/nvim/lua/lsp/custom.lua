local buf_map = require "utils".buf_map

local M = {}

function M.on_init()
  vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
      signs = true,
      underline = true,
      update_in_insert = false,
      virtual_text = false,
    }
  )

  -- cleaner signcolumn
  vim.fn.sign_define("LspDiagnosticsSignError", {text = "", numhl = "LspDiagnosticsDefaultError"})
  vim.fn.sign_define("LspDiagnosticsSignWarning", {text = "", numhl = "LspDiagnosticsDefaultWarning"})
  vim.fn.sign_define("LspDiagnosticsSignInformation", {text = "", numhl = "LspDiagnosticsDefaultInformation"})
  vim.fn.sign_define("LspDiagnosticsSignHint", {text = "", numhl = "LspDiagnosticsDefaultHint"})

  print("LSP initialized.")
end

function M.lsp_keymap()
  buf_map("n", "gn", "vim.lsp.diagnostic.goto_next({enable_popup = true})")
  buf_map("n", "gp", "vim.lsp.diagnostic.goto_prev({enable_popup = true})")
  buf_map("n", "<Space>gl", "vim.lsp.diagnostic.set_loclist({open_loclist = true})")
  buf_map("n", "<Space>gf", "vim.lsp.buf.formatting()")
  buf_map("n", "<Space>gd", "vim.lsp.buf.definition()")
  buf_map("n", "<Space>gi", "vim.lsp.buf.implementation()")
  buf_map("n", "<Space>gr", "vim.lsp.buf.references()")
end

return M
