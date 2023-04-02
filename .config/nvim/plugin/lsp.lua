local autocmd = vim.api.nvim_create_autocmd

-- individual server configs located in /after/ftplugin/*.lua
autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    local bufnr = args.buf

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
    vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"
    vim.bo[bufnr].tagfunc = "v:lua.vim.lsp.tagfunc"
    vim.bo[bufnr].formatexpr = "v:lua.vim.lsp.formatexpr()"

    -- highlight active param in signature_help; link it to "Search" highlight group.
    vim.api.nvim_set_hl(0, "LspSignatureActiveParameter", { link = "Search" })

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
    local key_opts = { buffer = bufnr, noremap = true, silent = true }

    set("n", "gn",    "<cmd>lua vim.diagnostic.goto_next({ enable_popup = false })<CR>", key_opts)
    set("n", "gp",    "<cmd>lua vim.diagnostic.goto_prev({ enable_popup = false })<CR>", key_opts)
    set("n", "gd",    vim.lsp.buf.definition, key_opts)
    set("n", "gf",    vim.lsp.buf.format, key_opts)
    set("n", "gi",    "<cmd>lua vim.lsp.buf.implementation()<CR>", key_opts)
    set("n", "gj",    toggle_diagnostics, key_opts)
    set("n", "gl",    "<cmd>lua vim.diagnostic.setloclist({ open_loclist = true })<CR>", key_opts)
    set("n", "gr",    vim.lsp.buf.references, key_opts)
    set("i", "<C-l>", vim.lsp.buf.signature_help, key_opts)

    print("LSP server initialized.")
  end,
})
