" folding
syntax region foldBraces start=/{/ end=/}/ transparent fold keepend extend
setlocal foldenable
setlocal foldmethod=syntax
setlocal foldlevel=0
setlocal foldnestmax=3
setlocal foldcolumn=0
" tabbing
setlocal softtabstop=2
setlocal shiftwidth=2
setlocal autoindent
setlocal expandtab
" misc
setlocal breakindent
setlocal colorcolumn=81

