-- makeprg ---------------------------------------------------------------------

-- shellcheck: use `:lmake %` to populate loclist.
if vim.fn.executable("shellcheck") == 1 then
  vim.cmd("compiler shellcheck")
end

-- formatprg -------------------------------------------------------------------

-- shfmt: use `gq` operator.
if vim.fn.executable("shfmt") == 1 then
  vim.opt_local.formatprg = "shfmt -i 2 -ci"

  local user_lint = vim.api.nvim_create_augroup("UserLint", { clear = true })
  vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    pattern = "<buffer>",
    group = user_lint,
    command = "silent normal gggqG",
    desc = "Run formatprg before save.",
  })
end
