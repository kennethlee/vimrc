" options {{{1

" encoding must be set before scriptencoding
set encoding=utf-8
scriptencoding utf-8
set nomodeline
set clipboard+=unnamedplus
filetype indent off
filetype plugin on
syntax on
set runtimepath+=~/.fzf

" gb: normally, Vim messes with iskeyword when you open a shell file. This can
" leak out, polluting other file types even after a 'set ft=' change. This
" variable prevents the iskeyword change so it can't hurt anyone
let g:sh_noisk = 1

if executable('rg')
  set grepprg=rg\ --vimgrep\ --no-heading
  set grepformat=%f:%l:%c:%m,%f:%l:%m
endif

" enable
" note for nvim: matchit is on by default
runtime macros/matchit.vim
packadd cfilter

" disable
let g:loaded_netrwPlugin = 1

set autoindent
set autoread
set backspace=indent,eol,start
set breakindent
set cmdheight=2
set cmdwinheight=20
set cursorcolumn
set expandtab
set foldmethod=manual
set foldnestmax=5
set foldopen-=block
set foldtext=fold#HeaderText()
set hidden
set hlsearch
set ignorecase
set inccommand=nosplit
set incsearch
set keywordprg=:DD
set linebreak
set list
set listchars=tab:▸\ ,eol:¬,trail:@
set nobackup
set noequalalways
set nofoldenable
set nojoinspaces
set noswapfile
set number
set shiftwidth=2
set showmode
set smartcase
set softtabstop=2
set splitbelow
set splitright
set switchbuf=useopen
set synmaxcol=150
set tabstop=2
set termguicolors
set title t_ti= t_te=
set wildignorecase
set wildmenu
set wildmode=list:longest,full
set winwidth=90 winminwidth=40
set wrap

" ==============================================================================
" commands {{{1

command! Bdelete                lexpr [] | lclose | bprevious | bdelete #
command! Bnext                  lexpr [] | lclose | bnext
command! Bprevious              lexpr [] | lclose | bprevious
command! Chreg                  call macro#ChangeRegister()
command! RemoveFancyCharacters  call file#RemoveFancyCharacters()
command! RenameFile             call file#RenameFile()
command! ToggleLocationList     call window#ToggleLocationList()
command! ToggleQuickfixList     call window#ToggleQuickfixList()
command! WipeMarks              delmarks! | delmarks A-Z0-9
command! WipeRegisters
  \   for s:i in range(34,122)
  \|    silent! call setreg(nr2char(s:i), [])
  \|  endfor

" ==============================================================================
" augroups {{{1

augroup user_fold
  autocmd!
augroup END

augroup user_highlight
  autocmd!
augroup END

augroup user_lint
  autocmd!
augroup END

augroup user_misc
  autocmd!
  autocmd user_misc BufWritePost $MYVIMRC nested source $MYVIMRC
augroup END

augroup user_quickfix
  autocmd!
  " automatically open loclist / quickfix window if there are valid errors
  " after executing quickfix commands
  autocmd user_quickfix QuickFixCmdPost [^l]* botright cwindow
  autocmd user_quickfix QuickFixCmdPost l* lwindow
augroup END

augroup user_startup
  autocmd!
  autocmd user_startup VimEnter * WipeMarks
  autocmd user_startup VimEnter * WipeRegisters
augroup END

" ==============================================================================
" display {{{1

" properly highlight tabs / trailing whitespace
highlight link UnwantedWhitespace WarningMsg
" this must be kept here, **above** the setting of colorscheme
autocmd user_highlight BufEnter,WinEnter *
  \   call clearmatches()
  \|  call matchadd('UnwantedWhitespace', '\s\+$', 100)
  \|  call matchadd('UnwantedWhitespace', '\t', 100)

colorscheme base16-eighties

" show fzf in a floating window rather than a split.
if executable('fzf')
  let g:fzf_layout = { 'window': { 'width': 0.80, 'height': 0.80 }}
endif

set statusline=%#error#%m%*\ %<%f\ %=%-19(%3l,%02c%03V%)

" ==============================================================================
" keymap: general {{{1

set mousehide mouse=nicr

nnoremap J  mzJ`z
nnoremap U  <C-r>
noremap  x  "_x
nnoremap Y  y$
nnoremap zz za

nnoremap <silent> _             :call textobject#NextIndent(0, 0, 0, 1)<CR>
onoremap <silent> _             :call textobject#NextIndent(0, 0, 0, 1)<CR>
vnoremap <silent> _             <Esc>:call textobject#NextIndent(0, 0, 0, 1)<CR>m'gv''
nnoremap <silent> +             :call textobject#NextIndent(0, 1, 0, 1)<CR>
onoremap <silent> +             :call textobject#NextIndent(0, 1, 0, 1)<CR>
vnoremap <silent> +             <Esc>:call textobject#NextIndent(0, 1, 0, 1)<CR>m'gv''

nnoremap          <BS>          <C-^>
nnoremap <silent> <C-h>         :Bprevious<CR>
nnoremap <silent> <C-l>         :Bnext<CR>
nnoremap <silent> <C-k>         :cprevious<CR>
nnoremap <silent> <C-j>         :cnext<CR>
nnoremap <silent> <M-k>         :lprevious<CR>
nnoremap <silent> <M-j>         :lnext<CR>
nnoremap <silent> <Esc>         :nohlsearch<CR><Esc>
inoremap <silent> <expr><F8>    strftime("%FT%T%z, %a")
inoremap <silent> <expr><Tab>   key#SmartTab()
inoremap <silent> <S-Tab>       <C-n>

" ==============================================================================
" keymap: <Space> {{{1

nnoremap          <Space>       <Nop>

nnoremap          <Space>bb     :ls<CR>:buffer<Space>*
nnoremap          <Space>bs     :ls<CR>:sbuffer<Space>*
nnoremap          <Space>bv     :ls<CR>:vertical<Space>sbuffer<Space>*
nnoremap <silent> <Space>bd     :Bdelete<CR>

nnoremap <silent> <Space>ff     :set expandtab? fileencoding? fileformat? filetype?<CR>
nnoremap          <Space>fc     :RemoveFancyCharacters<CR>
nnoremap <silent> <Space>fp     :%!prettier --stdin --stdin-filepath % --trailing-comma all<CR>
nnoremap <silent> <Space>fr     :RenameFile<CR>
nnoremap <silent> <Space>ft     :%s/\s\+$//e<CR>:let @/=''<CR>
nnoremap <silent> <Space>fw     :set wrap!<CR>
nnoremap <silent> <Space>vv     :edit $MYVIMRC<CR>

nnoremap <silent> <Space>tr     :FZF<CR>
nnoremap          <Space>te     :FZF ~/
nnoremap <silent> <Space>tj     :FZF ~/Dropbox/notes<CR>
nnoremap <silent> <Space>tl     :edit ~/.ledger/current.journal<CR>zm
nnoremap <silent> <Space>tn     :FZF ~/Documents/notes<CR>
nnoremap <silent> <Space>to     :FZF ~/Dropbox/Apps/todo<CR>

nnoremap <silent> <Space>q      :ToggleQuickfixList<CR>
nnoremap <silent> <Space>l      :ToggleLocationList<CR>

" ==============================================================================
" }}}1

