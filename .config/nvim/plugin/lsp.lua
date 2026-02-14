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
  virtual_text = { current_line = true },
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

-- returns list of LSP clients (long names truncated); else, empty string
---@return string
local function lsp_status()
  local attached_clients = vim.lsp.get_clients({ bufnr = 0 })
  if #attached_clients == 0 then
    return ""
  end
  local names = vim.iter(attached_clients)
  :map(function(client)
    local name = client.name:gsub("language.server", "ls")
    return name
  end)
  :totable()
  return "Attached LSP clients: [" .. table.concat(names, ", ") .. "]"
end

-- basic LSP-based auto-completion via gpanders
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(event)
    local client = vim.lsp.get_client_by_id(event.data.client_id)
    if client:supports_method("textDocument/completion") then
      vim.opt.completeopt = { "menu", "menuone", "noinsert", "fuzzy", "popup" }
      vim.lsp.completion.enable(true, client.id, event.buf, { autotrigger = true })
    end
    -- turn hints off to start; use `grh` to toggle on
    vim.lsp.inlay_hint.enable(false)

    -- set keymaps
    vim.keymap.set("n", "grf", vim.lsp.buf.format)
    vim.keymap.set("n", "grj", toggle_diagnostics)
    vim.keymap.set("n", "grl", "<cmd>lua vim.diagnostic.setloclist({ open_loclist = true })<CR>")
    -- toggle inlay hints
    vim.keymap.set("n", "grh",
      function()
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({0}), {0})
      end
    )
    vim.keymap.set("n", "<Space>k", function()
      vim.diagnostic.config({ virtual_lines = { current_line = true }, virtual_text = false })
      vim.api.nvim_create_autocmd("CursorMoved", {
        group = vim.api.nvim_create_augroup("UserLint", { clear = true }),
        callback = function()
          vim.diagnostic.config({ virtual_lines = false, virtual_text = true })
          return true
        end,
      })
    end)

    print(lsp_status())
  end,
})
