if &filetype ==# 'css'
  autocmd user_fold BufNewFile,BufRead,BufWinEnter <buffer>
    \   setlocal foldcolumn=1
    \|  setlocal foldmethod=indent
    \|  setlocal foldnestmax=4

  " Per the Prettier docs:
  " Note that if there's a syntax error in your code, the whole buffer will be
  " replaced with an error message. You'll need to press u to get your code back.
  " Another disadvantage of this approach is that the cursor position won't
  " be preserved.
  if executable('prettier')
    setlocal formatprg=prettier\ --stdin-filepath\ %\ --trailing-comma\ all
    " autocmd user_lint BufWritePre <buffer> normal gggqG
  endif
endif

