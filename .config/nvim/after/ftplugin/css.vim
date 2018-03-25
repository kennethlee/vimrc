" fold {{{1

setlocal foldenable
setlocal foldlevel=0
setlocal foldnestmax=4
setlocal foldcolumn=1

function! s:SetFoldMethodIndent() abort
  setlocal foldmethod=indent
  setlocal foldtext=fold#HeaderText()
endfunction

autocmd vimrc_fold BufWinEnter <buffer> call s:SetFoldMethodIndent()

" ==============================================================================
" }}}1

