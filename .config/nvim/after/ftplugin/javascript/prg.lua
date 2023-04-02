local executable = vim.fn.executable
local opt_local = vim.opt_local

-- makeprg ---------------------------------------------------------------------

-- eslint_d: use `:lmake %` to populate loclist.
if executable("eslint_d") == 1 then
  vim.cmd("compiler eslint")
end

-- formatprg -------------------------------------------------------------------

-- prettier: use `gq` operator.
if executable("prettier") == 1 then
  opt_local.formatprg = "npx prettier --stdin-filepath % --trailing-comma all"
end
