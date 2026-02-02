-- makeprg ---------------------------------------------------------------------

-- shellcheck: use `:lmake %` to populate loclist.
if vim.fn.executable("shellcheck") == 1 then
  vim.cmd("compiler shellcheck")
end

-- formatprg -------------------------------------------------------------------

-- shfmt: use `gq` operator.
if vim.fn.executable("shfmt") == 1 then
  vim.opt_local.formatprg = "shfmt -i 2 -ci"
end
