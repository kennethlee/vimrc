if &filetype ==# 'json'
  autocmd user_fold BufNewFile,BufRead,BufWinEnter <buffer>
    \   setlocal foldcolumn=1
    \|  setlocal foldmethod=indent
    \|  setlocal foldnestmax=4
  setlocal expandtab
  setlocal foldlevel=1
  setlocal omnifunc=v:lua.vim.lsp.omnifunc
  setlocal shiftwidth=2
  setlocal softtabstop=2
  setlocal tabstop=2

  if executable('prettier')
    setlocal formatprg=npx\ prettier\ --stdin-filepath\ %\ --trailing-comma\ all
    " autocmd user_lint BufWritePre <buffer> :normal gggqG
  endif
endif
