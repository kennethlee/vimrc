local mapper = function(mode, key, result)
  vim.api.nvim_buf_set_keymap(0, mode, key, "<cmd>lua "..result.."<CR>", {noremap = true, silent = true})
end

local function custom_attach()
  -- mappings
  mapper("n", "gn", "vim.lsp.diagnostic.goto_next({enable_popup = false})")
  mapper("n", "gp", "vim.lsp.diagnostic.goto_prev({enable_popup = false})")
  mapper("n", "<Space>gl", "vim.lsp.diagnostic.set_loclist({open_loclist = true})")
  mapper("n", "<Space>gd", "vim.lsp.buf.definition()")
  mapper("n", "<Space>gi", "vim.lsp.buf.implementation()")
  mapper("n", "<Space>gr", "vim.lsp.buf.references()")
end

return custom_attach
