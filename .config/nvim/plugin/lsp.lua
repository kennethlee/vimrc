-- New default mappings (LSP-related):
-- grn       = Normal mode -> vim.lsp.buf.rename()
-- grr       = Normal mode -> vim.lsp.buf.references()
-- gri       = Normal mode -> vim.lsp.buf.implementation()
-- gO        = Normal mode -> vim.lsp.buf.document_symbol() (this is analogous to the gO mappings in help buffers and :Man page buffers to show a "table of contents")
-- gra       = Normal / Visual modes. -> vim.lsp.buf.code_action()
-- K         = Normal mode -> vim.lsp.buf.hover()
-- CTRL-S    = Insert / Select modes. -> vim.lsp.buf.signature_help()
-- [d and ]d = Move between diagnostics in the current buffer ([D jumps to the first diagnostic, ]D jumps to the last)

vim.diagnostic.config({
  virtual_lines = { current_line = true, },
  -- virtual_text = true,
  -- virtual_text = { current_line = true },
})

-- diagnostics toggle
local diagnostics_active = true
local toggle_diagnostics = function()
  diagnostics_active = not diagnostics_active
  if diagnostics_active then
    vim.diagnostic.show()
  else
    vim.diagnostic.hide()
  end
end

-- basic LSP-based auto-completion via gpanders
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(event)
    local client = vim.lsp.get_client_by_id(event.data.client_id)
    if client:supports_method("textDocument/completion") then
      vim.lsp.completion.enable(true, client.id, event.buf, { autotrigger = true })
    end

    vim.lsp.inlay_hint.enable(true)

    -- disable inlay hints in Insert Mode
    -- and turn hints back on when leaving (IF hints are toggled on)
    vim.api.nvim_create_autocmd("InsertEnter", {
      desc = "Disable lsp.inlay_hint when in insert mode",
      callback = function(args)
        local filter = { bufnr = args.buf }
        local inlay_hint = vim.lsp.inlay_hint
        if inlay_hint.is_enabled(filter) then
          inlay_hint.enable(false, filter)
          vim.api.nvim_create_autocmd("InsertLeave", {
            once = true,
            desc = "Re-enable lsp.inlay_hint when leaving insert mode",
            callback = function()
              inlay_hint.enable(true, filter)
            end,
          })
        end
      end,
    })

    -- set keymaps
    vim.keymap.set("n", "grf", vim.lsp.buf.format)
    vim.keymap.set("n", "grj", toggle_diagnostics)
    vim.keymap.set("n", "grl", "<cmd>lua vim.diagnostic.setloclist({ open_loclist = true })<CR>")
    -- toggle inlay hints
    vim.keymap.set("n", "grh",
      function()
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ 0 }), { 0 })
      end
    )

    print("Language server ready.")
  end,
})
