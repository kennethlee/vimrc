vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    -- set initial state of virtual_text
    vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
      vim.lsp.diagnostic.on_publish_diagnostics, {
        signs = true,
        underline = true,
        update_in_insert = false,
        virtual_text = false,
      }
    )

    -- enable omnifunc, tagfunc, formatexrp once language server attaches to buffer.
    vim.bo[args.buf].omnifunc = "v:lua.vim.lsp.omnifunc"
    vim.bo[args.buf].tagfunc = "v:lua.vim.lsp.tagfunc"
    vim.bo[args.buf].formatexpr = "v:lua.vim.lsp.formatexpr()"

    -- toggle virtual_text for <Space>gj
    local diagnostics_active = true
    local toggle_diagnostics = function()
      diagnostics_active = not diagnostics_active
      if diagnostics_active then
        vim.diagnostic.show()
      else
        vim.diagnostic.hide()
      end
    end

    -- enable LSP-specific keybindings.
    local set = vim.keymap.set
    local key_opts = { buffer = args.buf, noremap = true, silent = true }

    set("n", "gn", "<cmd>lua vim.diagnostic.goto_next({ enable_popup = false })<CR>", key_opts)
    set("n", "gp", "<cmd>lua vim.diagnostic.goto_prev({ enable_popup = false })<CR>", key_opts)
    set("n", "gd", vim.lsp.buf.definition, key_opts)
    set("n", "gf", vim.lsp.buf.format, key_opts)
    set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", key_opts)
    set("n", "gj", toggle_diagnostics, key_opts)
    set("n", "gl", "<cmd>lua vim.diagnostic.setloclist({ open_loclist = true })<CR>", key_opts)
    set("n", "gr", vim.lsp.buf.references, key_opts)

    print("LSP server initialized.")
  end,
})
