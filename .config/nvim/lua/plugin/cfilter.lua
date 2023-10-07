return {
  {
    dir = "$VIMRUNTIME/pack/dist/opt/cfilter/plugin/cfilter.lua",
    enabled = true,
    lazy = true,
    cmd = { "Cfilter", "Lfilter" },
    config = function()
      vim.cmd("packadd cfilter")
    end,
  },
}
