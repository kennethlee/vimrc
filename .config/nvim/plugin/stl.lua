-- returns array of LSP clients (long names being truncated), else, empty string
local function lsp_status()
  local attached_clients = vim.lsp.get_clients({ bufnr = 0 })
  if #attached_clients == 0 then
    return ""
  end
  local names = vim.iter(attached_clients)
  :map(function(client)
    local name = client.name:gsub("language.server", "ls")
    return name
  end)
  :totable()
  return "[" .. table.concat(names, ", ") .. "]"
end

function _G.statusline()
  return table.concat({
    "%<",
    "%F",
    "%h%w%m%r",
    "%=",
    "%{% &showcmdloc == 'statusline' ? '%-10.S ' : '' %}",
    "%{% exists('b:keymap_name') ? '<'..b:keymap_name..'> ' : '' %}",
    "%{% &busy > 0 ? '◐ ' : '' %}",
    lsp_status(),
    "%{% luaeval('(package.loaded[''vim.diagnostic''] and #vim.diagnostic.count() ~= 0 and vim.diagnostic.status() .. '' '') or '''' ') %}",
    "%{% &ruler ? ( &rulerformat == '' ? '%-14.(%l,%c%V%) %P' : &rulerformat ) : '' %}",
  }, " ")
end

vim.o.statusline = "%{%v:lua._G.statusline()%}"
