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

" NETRW {{{1

let g:netrw_hide      = 1
let g:netrw_list_hide = '.*\.db,\.dmg,\.doc,\.DS_Store,\.gif,\.jpg,\.numbers,
    \\.pages,\.pdf,\.png,\.pyc,\.rar,\.so,\.sw*,\.tbz'

let g:netrw_bufsettings    = 'noma nomod nu nobl nowrap ro'
let g:netrw_special_syntax = 1
let g:netrw_fastbrowse     = 1
let g:netrw_dirhistmax     = 0
let g:netrw_banner         = 0

" }}}1
