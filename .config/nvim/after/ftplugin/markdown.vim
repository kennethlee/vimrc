let b:did_ftplugin = 1

" folding
setlocal foldenable
setlocal foldmethod=expr
setlocal foldexpr=autofxn#MarkdownLevel()
setlocal foldlevel=0
setlocal foldnestmax=6
setlocal foldcolumn=0

" misc
setlocal syn=off

