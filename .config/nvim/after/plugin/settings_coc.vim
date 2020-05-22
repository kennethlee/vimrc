if exists('g:did_coc_loaded')
  set signcolumn=yes:1
  set updatetime=300

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

  " for coc-pairs
  inoremap <silent> <expr><CR>
    \ pumvisible() ? coc#_select_confirm() :
    \ "\<C-g>u\<CR>\<C-r>=coc#on_enter()\<CR>"

  " Remap keys for gotos
  nmap     <silent> gd            <Plug>(coc-definition)
  nmap     <silent> gi            <Plug>(coc-implementation)
  nmap     <silent> gr            <Plug>(coc-references)
endif
