" fold {{{1

setlocal foldenable
setlocal foldlevel=0
setlocal foldnestmax=3
setlocal foldcolumn=1

function! s:SetFoldMethodMarker() abort
  setlocal foldmethod=marker
  setlocal foldtext=fold#HeaderText()
endfunction

autocmd vimrc_fold BufWinEnter <buffer> call s:SetFoldMethodMarker()

" ==============================================================================
" misc {{{1

setlocal colorcolumn=81

" ==============================================================================
" }}}1

