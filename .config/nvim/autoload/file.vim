" RemoveFancyCharacters {{{1

function! file#RemoveFancyCharacters() abort
  let l:typo = {}
  let l:typo["“"] = '"'
  let l:typo["”"] = '"'
  let l:typo["‘"] = "'"
  let l:typo["’"] = "'"
  let l:typo["″"] = '"'
  let l:typo["′"] = "'"
  let l:typo["–"] = '--'
  let l:typo["—"] = '---'
  let l:typo["…"] = '...'
  let l:typo["⅛"] = '1/8'
  let l:typo["¼"] = '1/4'
  let l:typo["⅓"] = '1/3'
  let l:typo["½"] = '1/2'
  let l:typo["⅔"] = '2/3'
  let l:typo["¾"] = '3/4'
  execute ":%s/".join(keys(l:typo), '\|').'/\=l:typo[submatch(0)]/ge'
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RenameFile {{{1

function! file#RenameFile() abort
  let l:old_name = expand('%')
  let l:new_name = input('New file name: ', expand('%'), 'file')
  if l:new_name !=# '' && l:new_name !=# l:old_name
    execute ':saveas ' . l:new_name
    execute ':silent !rm ' . l:old_name
    redraw!
  endif
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" }}}1
