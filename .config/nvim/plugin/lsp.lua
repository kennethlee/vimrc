-- [Default LSP-related mappings](https://neovim.io/doc/user/diagnostic.html#diagnostic-defaults)
-- gO         = Normal -> vim.lsp.buf.document_symbol (this is analogous to the gO mappings in help buffers and :Man page buffers to show a "table of contents")
-- gra        = Normal / Visual -> vim.lsp.buf.code_action
-- gri        = Normal -> vim.lsp.buf.implementation
-- grn        = Normal -> vim.lsp.buf.rename
-- grr        = Normal -> vim.lsp.buf.references
-- grx        = Normal -> vim.lsp.codelens.run https://github.com/neovim/neovim/pull/37689
-- K          = Normal -> vim.lsp.buf.hover
-- CTRL-S     = Insert / Select -> vim.lsp.buf.signature_help
-- [d , ]d    = Jumps between diagnostics in the current buffer
-- [D , ]D    = Jumps to the first and last diagnostic of the current buffer
-- <Ctrl-w>d  = Shows diagnostic at cursor in a floating window.
-- my own mappings:
-- grf        = Normal -> vim.lsp.buf.format
-- grj        = Normal -> toggle_diagnostics
-- grl        = Normal -> vim.diagnostic.setloclist
-- grh        = Normal -> vim.lsp.inlay_hint.enable
-- <Space>k   = Normal -> diagnostics

vim.diagnostic.config({
  float = {
    focusable = true,
    -- scope: setting to value of `line` will display a numbered list of diagnostics for the current line.
    scope = "cursor",
    source = true,
    -- `minimal` is currently the only value supported. https://neovim.io/doc/user/api.html#api-win_config
    style = "minimal",
  },
  jump = { on_jump = vim.diagnostic.open_float },
  update_in_insert = true,
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

-- basic LSP auto-completion with improved window sizing (avoids squashing documentation window)
local ns = vim.api.nvim_create_namespace("")

local function lsp_on_attach(client_id, bufnr)
  local client = assert(vim.lsp.get_client_by_id(client_id))
  if client:supports_method("textDocument/completion") then
    vim.lsp.completion.enable(true, client.id, bufnr, {
      autotrigger = true,
      convert = function(item)
        return { abbr = item.label }
      end,
    })
    vim.api.nvim_create_autocmd("CompleteChanged", {
      buf = bufnr,
      callback = function()
        vim.api.nvim_buf_clear_namespace(bufnr, ns, 0, -1)
        local completed_item = vim.v.event.completed_item or {}
        local data = vim.tbl_get(completed_item, "user_data", "nvim", "lsp")
        if not data then
          return
        end
        local detail = vim.tbl_get(data, "completion_item", "labelDetails", "detail")
        if detail and #detail > 0 then
          local lnum, col = unpack(vim.api.nvim_win_get_cursor(0))
          vim.api.nvim_buf_set_extmark(
            bufnr,
            ns,
            lnum - 1,
            col,
            { virt_text = { { detail, "LspInlayHint" } }, virt_text_pos = "overlay" }
          )
        end
      end,
    })
    vim.api.nvim_create_autocmd("CompleteDone", {
      buf = bufnr,
      callback = function()
        vim.api.nvim_buf_clear_namespace(bufnr, ns, 0, -1)
      end,
    })
  end
end

local user_lint = vim.api.nvim_create_augroup("UserLint", { clear = true })
vim.api.nvim_create_autocmd("LspAttach", {
  group = user_lint,
  callback = function(event)
    lsp_on_attach(event.data.client_id, event.buf)
    vim.lsp.codelens.enable(true)

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
        group = user_lint,
        callback = function()
          vim.diagnostic.config({ virtual_lines = false, virtual_text = false })
          return true
        end,
      })
    end)

    print(lsp_status())
  end,
})
