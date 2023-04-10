-- bootstrap lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local disabled_plugins = {
  "2html_plugin",
  "getscript",
  "getscriptPlugin",
  "gzip",
  "logiPat",
  "matchparen",
  "netrw",
  "netrwFileHandlers",
  "netrwPlugin",
  "netrwSettings",
  "rrhelper",
  "tar",
  "tarPlugin",
  "tohtml",
  "tutor",
  "vimball",
  "vimballPlugin",
  "zip",
  "zipPlugin",
}

require("lazy").setup("plugin", {
  performance = {
    rtp = {
      -- note: fzf installation now done via brew.
      paths = { "/usr/local/opt/fzf", },
      disabled_plugins = disabled_plugins,
    },
  },
})
