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
  print("LSP initialized.")
end

function M.lsp_keymap()
  virtual_text = {}
  virtual_text.show = false

  virtual_text.toggle = function()
    virtual_text.show = not virtual_text.show
    if virtual_text.show == true then
      vim.diagnostic.disable()
    else
      vim.diagnostic.enable()
    end
  end

  vim.api.nvim_buf_set_keymap(0, "n", "gn",         "<cmd>lua vim.diagnostic.goto_next({enable_popup = false})<CR>", {noremap = true, silent = true})
  vim.api.nvim_buf_set_keymap(0, "n", "gp",         "<cmd>lua vim.diagnostic.goto_prev({enable_popup = false})<CR>", {noremap = true, silent = true})
  vim.api.nvim_buf_set_keymap(0, "n", "<Space>gd",  "<cmd>lua vim.lsp.buf.definition()<CR>", {noremap = true, silent = true})
  vim.api.nvim_buf_set_keymap(0, "n", "<Space>gf",  "<cmd>lua vim.lsp.buf.format()<CR>", {noremap = true, silent = true})
  vim.api.nvim_buf_set_keymap(0, "n", "<Space>gi",  "<cmd>lua vim.lsp.buf.implementation()<CR>", {noremap = true, silent = true})
  vim.api.nvim_buf_set_keymap(0, "n", "<Space>gj",  "<cmd>lua virtual_text.toggle()<CR>", {silent=true, noremap=true})
  vim.api.nvim_buf_set_keymap(0, "n", "<Space>gl",  "<cmd>lua vim.diagnostic.setloclist({open_loclist = true})<CR>", {noremap = true, silent = true})
  vim.api.nvim_buf_set_keymap(0, "n", "<Space>gr",  "<cmd>lua vim.lsp.buf.references()<CR>", {noremap = true, silent = true})
end

return M
