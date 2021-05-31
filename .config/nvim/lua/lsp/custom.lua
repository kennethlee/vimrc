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
  vim.api.nvim_buf_set_keymap(0, "n", "gn", "<cmd>lua vim.lsp.diagnostic.goto_next({enable_popup = true})<CR>", {noremap = true, silent = true})
  vim.api.nvim_buf_set_keymap(0, "n", "gp", "<cmd>lua vim.lsp.diagnostic.goto_prev({enable_popup = true})<CR>", {noremap = true, silent = true})
  vim.api.nvim_buf_set_keymap(0, "n", "<Space>gl", "<cmd>lua vim.lsp.diagnostic.set_loclist({open_loclist = true})<CR>", {noremap = true, silent = true})
  vim.api.nvim_buf_set_keymap(0, "n", "<Space>gf", "<cmd>lua vim.lsp.buf.formatting()<CR>", {noremap = true, silent = true})
  vim.api.nvim_buf_set_keymap(0, "n", "<Space>gd", "<cmd>lua vim.lsp.buf.definition()<CR>", {noremap = true, silent = true})
  vim.api.nvim_buf_set_keymap(0, "n", "<Space>gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", {noremap = true, silent = true})
  vim.api.nvim_buf_set_keymap(0, "n", "<Space>gr", "<cmd>lua vim.lsp.buf.references()<CR>", {noremap = true, silent = true})
end

return M
