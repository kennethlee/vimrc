if &filetype ==# 'css'
  autocmd user_fold BufNewFile,BufRead,BufWinEnter <buffer>
    \   setlocal foldcolumn=1
    \|  setlocal foldmethod=indent
    \|  setlocal foldnestmax=4
  setlocal expandtab
  setlocal omnifunc=v:lua.vim.lsp.omnifunc
  setlocal shiftwidth=2
  setlocal softtabstop=2
  setlocal tabstop=2

  if executable('prettier')
    setlocal formatprg=prettier\ --stdin-filepath\ %
    " autocmd user_lint BufWritePre <buffer> normal gggqG
  endif
endif

