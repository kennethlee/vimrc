let b:did_ftplugin = 1

setlocal foldenable
setlocal foldlevel=0
setlocal foldnestmax=6
setlocal foldcolumn=1

function! MarkdownLevel() abort
  let currentline = getline(v:lnum)
  if match(currentline, '^#\{1,6}\s') >= 0
    let header_level = strlen(substitute(currentline, '^\(#\{1,6}\).*', '\1', ''))
    return '>' . header_level
  endif
  return '='
endfunction

function! s:SetFoldMethodExpr() abort
  setlocal foldmethod=expr
  setlocal foldexpr=MarkdownLevel()
  setlocal foldtext=fold#HeaderText()
endfunction

autocmd vimrc_fold BufWinEnter <buffer> call s:SetFoldMethodExpr()

