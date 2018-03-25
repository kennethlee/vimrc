" fold {{{1

setlocal foldenable
setlocal foldlevel=2
setlocal foldnestmax=5
setlocal foldcolumn=1

function! s:SetFoldMethodIndent() abort
  setlocal foldmethod=indent
  setlocal foldtext=fold#HeaderText()
endfunction

autocmd vimrc_fold BufWinEnter <buffer> call s:SetFoldMethodIndent()

" ==============================================================================
" }}}1

