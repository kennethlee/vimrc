local M = {}

function M.buf_map(mode, key, cmd, opts)
  vim.api.nvim_buf_set_keymap(
    0,
    mode,
    key,
    "<cmd>lua "..cmd.."<CR>",
    opts or {noremap = true, silent = true}
  )
end

return M
