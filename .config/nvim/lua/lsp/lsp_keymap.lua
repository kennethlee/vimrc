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

    -- enable LSP-specific keybindings.
    vim.api.nvim_buf_set_keymap(0, "n", "gn", "<cmd>lua vim.diagnostic.goto_next({enable_popup = false})<CR>", {noremap = true, silent = true})
    vim.api.nvim_buf_set_keymap(0, "n", "gp", "<cmd>lua vim.diagnostic.goto_prev({enable_popup = false})<CR>", {noremap = true, silent = true})
    vim.api.nvim_buf_set_keymap(0, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", {noremap = true, silent = true})
    vim.api.nvim_buf_set_keymap(0, "n", "gf", "<cmd>lua vim.lsp.buf.format()<CR>", {noremap = true, silent = true})
    vim.api.nvim_buf_set_keymap(0, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", {noremap = true, silent = true})
    vim.api.nvim_buf_set_keymap(0, "n", "gj", "<cmd>lua virtual_text.toggle()<CR>", {silent = true, noremap = true})
    vim.api.nvim_buf_set_keymap(0, "n", "gl", "<cmd>lua vim.diagnostic.setloclist({open_loclist = true})<CR>", {noremap = true, silent = true})
    vim.api.nvim_buf_set_keymap(0, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", {noremap = true, silent = true})

    print("LSP initialized.")
  end,
})