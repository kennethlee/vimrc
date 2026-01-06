local bin_name = "zls"
local cmd = { bin_name }
local filetypes = {
  "zig",
}
local root_files = {
  "build.zig",
  "build.zig.zon",
  ".git",
}

vim.lsp.start({
  name = "zls",
  cmd = cmd,
  filetypes = filetypes,
  -- root_dir = vim.fn.getcwd(),
  root_markers = root_files,
  single_file_support = true,
})
