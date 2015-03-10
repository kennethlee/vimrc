" Cmd2 {{{1

function! s:CustomFuzzySearch(string)
  let pattern = ""
  let ignore_case = g:Cmd2__complete_ignorecase ? '\c' : ''
  let char = matchstr(a:string, ".", byteidx(a:string, 0))
  let pattern = '\V' . ignore_case
  let pattern .= '\<\%(\[agls]\:\)\?'
  let pattern .= '\%(\%(\k\*\[._\-#]\)\?' . char . '\|\k\*\%(' . char . '\&\L\)\)'
  if g:Cmd2__complete_fuzzy
    let result = ''
    let i = 1
    while i < len(a:string)
      let char = matchstr(a:string, ".", byteidx(a:string, i))
      let result .= '\%(' . '\%(\k\*\[._\-#]\)\?' . char . '\|'
      let result .= '\k\*\%(' . char . '\&\L\)' . '\)'
      let i += len(char)
    endwhile
    let pattern .= result
  else
    let pattern .= a:string
  endif
  let pattern .= g:Cmd2__complete_end_pattern
  return pattern
endfunction

let g:Cmd2_options = {
      \ '_complete_ignorecase': 1,
      \ '_complete_uniq_ignorecase': 0,
      \ '_complete_pattern_func': function('s:CustomFuzzySearch'),
      \ '_complete_start_pattern': '\<\(\[agls]\:\)\?\(\k\*\[_\-#]\)\?',
      \ '_complete_fuzzy': 1,
      \ '_complete_string_pattern': '\v\k(\k|\.)*$',
      \ '_complete_loading_text': '...',
      \ }

let g:Cmd2_cmd_mappings = {
      \ "CF": {'command': function('Cmd2#ext#complete#Main'), 'type': 'function'},
      \ "CB": {'command': function('Cmd2#ext#complete#Main'), 'type': 'function'},
      \ }

cmap <C-S> <Plug>Cmd2  " Change this to your preferred mapping
cmap <expr> <Tab> Cmd2#ext#complete#InContext() ? "\<Plug>Cmd2CF" : "\<Tab>"
cmap <expr> <S-Tab> Cmd2#ext#complete#InContext() ? "\<Plug>Cmd2CB" : "\<S-Tab>"

set wildcharm=<Tab>

" CtrlP {{{1

" Enable!
" set runtimepath^=~/.vim/bundle/ctrlp.vim

let g:ctrlp_match_window        = 'bottom,order:ttb,min:50,max:50'
let g:ctrlp_working_path_mode   = 'ra'
let g:ctrlp_open_multiple_files = 'i'
let g:ctrlp_mruf_default_order  = '1'
let g:ctrlp_arg_map             = '1'
let g:ctrlp_extensions          = ['line']
let g:ctrlp_custom_ignore       = '\v[\/]\.(git|hg|svn)$'

" Let Ctrlp use ag
" From: http://robots.thoughtbot.com/faster-grepping-in-vim
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor\ --column
  set grepformat=%f:%l:%c%m

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" PyMatcher for CtrlP
if !has('python')
  echo 'In order to use pymatcher plugin, you need +python compiled vim'
else
  let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
endif

" Set delay to prevent extra search
let g:ctrlp_lazy_update = 150

" Do not clear filenames cache, to improve CtrlP startup
" You can manualy clear it by <F5>
let g:ctrlp_clear_cache_on_exit = 0

" Set no file limit, we are building a big project
let g:ctrlp_max_files = 0

" If ag is available use it as filename list generator instead of 'find'
if executable("ag")
    set grepprg=ag\ --nogroup\ --nocolor
    let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --ignore ''.git'' --ignore ''.DS_Store'' --ignore ''node_modules'' --hidden -g ""'
endif

" }}}1
