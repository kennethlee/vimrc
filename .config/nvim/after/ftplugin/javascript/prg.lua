-- makeprg ---------------------------------------------------------------------

-- eslint_d: use `:lmake %` to populate loclist.
if vim.fn.executable("eslint_d") == 1 then
  vim.cmd("compiler eslint")
end

-- formatprg -------------------------------------------------------------------

-- prettier: use `gq` operator.
if vim.fn.executable("prettier") == 1 then
  vim.opt_local.formatprg = "npx prettier --stdin-filepath % --trailing-comma all"
end
