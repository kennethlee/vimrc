if exists('g:did_coc_loaded')
  set signcolumn=yes:1
  set updatetime=500

  " Use <Tab> to trigger completion + navigate to next item
  function! s:CheckBackspace() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
  endfunction

  inoremap <silent> <expr><Tab>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>CheckBackspace() ? "\<Tab>" :
    \ coc#refresh()
  inoremap <silent> <expr><S-Tab>
    \ pumvisible() ?
    \ "\<C-p>" :
    \ "\<S-Tab>"

  " Remap keys for gotos
  nmap     <silent> gd            <Plug>(coc-definition)
  nmap     <silent> gi            <Plug>(coc-implementation)
  nmap     <silent> gr            <Plug>(coc-references)
endif
