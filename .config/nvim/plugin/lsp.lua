-- New default mappings (LSP-related):
-- grn       = Normal mode -> vim.lsp.buf.rename()
-- grr       = Normal mode -> vim.lsp.buf.references()
-- gri       = Normal mode -> vim.lsp.buf.implementation()
-- gO        = Normal mode -> vim.lsp.buf.document_symbol() (this is analogous to the gO mappings in help buffers and :Man page buffers to show a "table of contents")
-- gra       = Normal / Visual modes. -> vim.lsp.buf.code_action()
-- K         = Normal mode -> vim.lsp.buf.hover()
-- CTRL-S    = Insert / Select modes. -> vim.lsp.buf.signature_help()
-- [d and ]d = Move between diagnostics in the current buffer ([D jumps to the first diagnostic, ]D jumps to the last)

-- basic LSP-based auto-completion via gpanders
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if client:supports_method('textDocument/completion') then
      vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
    end
  end,
})
