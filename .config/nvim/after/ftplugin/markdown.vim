autocmd vimrc_fold BufNewFile,BufRead,BufWinEnter <buffer>
  \ setlocal foldexpr=fold#MarkdownLevel() foldmethod=expr
setlocal foldcolumn=1
setlocal foldlevel=0
setlocal foldnestmax=6

