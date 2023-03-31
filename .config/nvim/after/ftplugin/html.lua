local opt_local = vim.opt_local

opt_local.foldcolumn = "1"
opt_local.foldlevel = 2
opt_local.foldmethod = "indent"
opt_local.foldnestmax = 5

-- formatprg -------------------------------------------------------------------

local executable = vim.fn.executable

-- prettier: use `gq` operator.
if executable("prettier") == 1 then
  opt_local.formatprg = "npx prettier --stdin-filepath % --trailing-comma all"
end
