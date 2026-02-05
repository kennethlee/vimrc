-- makeprg ---------------------------------------------------------------------

-- romainl: vim apparently ships with a "compiler" for shellcheck
-- (so setting formatprg and errorformat in after/compiler/ only causes problems).
-- https://www.reddit.com/r/vim/comments/pgjsqb/comment/hbffy2i/

-- shellcheck: use `:lmake %` to populate loclist.
if vim.fn.executable("shellcheck") == 1 then
  vim.cmd("compiler shellcheck")

  local user_lint = vim.api.nvim_create_augroup("UserLint", { clear = true })
  vim.api.nvim_create_autocmd({ "BufWritePost" }, {
    desc = "Run makeprg on buffer after save.",
    pattern = "<buffer>",
    group = user_lint,
    command = "silent lmake! % | silent redraw!",
  })
end

-- formatprg -------------------------------------------------------------------

-- shfmt: use `gq` operator.
if vim.fn.executable("shfmt") == 1 then
  vim.opt_local.formatprg = "shfmt -i 2 -ci"

  -- local user_lint = vim.api.nvim_create_augroup("UserLint", { clear = true })
  -- vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  --   desc = "Run formatprg on buffer before save.",
  --   pattern = "<buffer>",
  --   group = user_lint,
  --   command = "silent normal gggqG",
  -- })
end
