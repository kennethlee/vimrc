local opt_local = vim.opt_local

opt_local.colorcolumn = "81"

-- matches for matchit
vim.cmd([[
if exists("loaded_matchit")
  let b:match_ignorecase=0
  let b:match_words =
    \  '\<if\>:\<else\>,'.
    " for react
    " \  '<:>,'.
    " \  '<\@<=!--:-->,'.
    " \  '<\@<=?\k\+:?>,'.
    " \  '<\@<=\([^ \t>/]\+\)\%(\s\+[^>]*\%([^/]>\|$\)\|>\|$\):<\@<=/\1>,'.
    " \  '<\@<=\%([^ \t>/]\+\)\%(\s\+[^/>]*\|$\):/>'
endif
]])
