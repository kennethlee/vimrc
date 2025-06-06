local bin_name = "lua-language-server"
local cmd = { bin_name, "--stdio" }
local root_files = {
  ".luarc.json",
  ".luacheckrc",
  ".stylua.toml",
  "stylua.toml",
  "selene.toml",
  ".git",
}
local filetypes = {
  "lua",
}

vim.lsp.start({
  name = "sumneko",
  cmd = cmd,
  filetypes = filetypes,
  root_dir = vim.fs.dirname(vim.fs.find(root_files, { upward = true })[1]),
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = "LuaJIT",
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { "vim" },
      },
      hint = {
        enable = true
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.env.RUNTIME,
        -- suppress annoying messages upon server start up
        checkThirdParty = false,
      },
      telemetry = {
        enable = false,
      },
    },
  },
})
