local stl = {
  "%#error#",      -- error highlight group begin
  "%m",            -- modified flag
  "%*",            -- error highlight group end
  "%<",            -- truncation point
  "%f",            -- filepath
  "%=",            -- separator
  "%{v:register}", -- display current register
  "%-18",          -- padding right, 18 char width
  "(%l,%c%V%)",    -- current {line #},{column #}-{virtual column #}
}

vim.o.statusline = table.concat(stl)
