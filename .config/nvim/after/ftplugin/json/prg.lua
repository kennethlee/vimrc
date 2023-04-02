local executable = vim.fn.executable
local opt_local = vim.opt_local

-- formatprg -------------------------------------------------------------------

-- prettier: use `gq` operator.
if executable("prettier") == 1 then
  opt_local.formatprg = "npx prettier --stdin-filepath % --trailing-comma all"
end
