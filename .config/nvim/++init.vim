" options {{{1

" encoding must be set before scriptencoding
set encoding=utf-8
scriptencoding utf-8
set nomodeline
set clipboard+=unnamedplus
filetype indent off
filetype plugin on
set runtimepath+=~/.fzf

if executable('rg')
  set grepprg=rg\ --vimgrep\ --no-heading\ --hidden\ --glob\ '!{.git,node_modules}/*'
  set grepformat=%f:%l:%c:%m,%f:%l:%m
endif

" enable
" note for nvim: matchit is on by default
packadd! matchit
packadd! cfilter

" disable
let g:loaded_netrw = 1
let g:loaded_netrwPlugin = 1

set autoindent
set autoread
set backspace=indent,eol,start
set breakindent
set cmdheight=2
set cmdwinheight=20
set completeopt=noselect,menuone
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
set listchars=eol:¬,tab:▸\ ,trail:@
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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" require {{{1

lua require("lsp")
lua require("pluginconfig")
lua require("treesitter")

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" augroups {{{1

augroup User_Fold
  autocmd!
augroup END

augroup User_Highlight
  autocmd!
augroup END

augroup User_Lint
  autocmd!
augroup END

augroup User_Misc
  autocmd!
  " retab and remove trailing whitespace
  autocmd User_Misc BufWritePre * retab | %s/\s\+$//e
  " remove trailing newlines
  autocmd User_Misc BufWritePre * %s/\n\+\%$//e | execute "normal \<C-o>"
  autocmd User_Misc BufWritePost $MYVIMRC nested source $MYVIMRC
augroup END

augroup User_Quickfix
  autocmd!
  autocmd User_Quickfix QuickFixCmdPost [^l]* botright cwindow
  autocmd User_Quickfix QuickFixCmdPost l* lwindow
augroup END

augroup User_Startup
  autocmd!
  autocmd User_Startup VimEnter * WipeMarks
  autocmd User_Startup VimEnter * WipeRegisters
augroup END

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" display {{{1

" properly highlight tabs / trailing whitespace
highlight link UnwantedWhitespace WarningMsg
" this must be kept here, **above** the setting of colorscheme
autocmd User_Highlight BufEnter,WinEnter *
  \   call clearmatches()
  \|  call matchadd('UnwantedWhitespace', '\s\+$', 100)
  \|  call matchadd('UnwantedWhitespace', '\t', 100)

" packadd! gruvbox-flat.nvim
" colorscheme gruvbox-flat

packadd! melange
colorscheme melange

" packadd! nvim-base16
" colorscheme base16-eighties

set statusline=%#error#%m%*%<%f%=%{v:register}%-18(%l,%c%V%)

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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

nnoremap <silent> 9             :vertical resize -10<CR>
nnoremap <silent> 0             :vertical resize +10<CR>

nnoremap <silent> <BS>          <C-^>
nnoremap <silent> <C-h>         :Bprevious<CR>
nnoremap <silent> <C-l>         :Bnext<CR>
nnoremap <silent> <C-k>         :cprevious<CR>
nnoremap <silent> <C-j>         :cnext<CR>
nnoremap <silent> <M-k>         :lprevious<CR>
nnoremap <silent> <M-j>         :lnext<CR>
nnoremap <silent> <Esc>         :nohlsearch<CR><Esc>
inoremap <silent> <expr><Tab>   key#InsertTabWrapper()
inoremap <silent> <S-Tab>       <C-n>

iabbrev <silent>  xdd           <C-r>=strftime("%FT%T%z, %a")<CR><BS>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" keymap: <Space> {{{1

noremap           <Space>       <Nop>

nnoremap <silent> <Space>bb     :ls<CR>:buffer<Space>*
nnoremap <silent> <Space>bs     :ls<CR>:sbuffer<Space>*
nnoremap <silent> <Space>bv     :ls<CR>:vertical<Space>sbuffer<Space>*
nnoremap <silent> <Space>bd     :Bdelete<CR>

nnoremap <silent> <Space>ff     :set expandtab? fileencoding? fileformat? filetype?<CR>
nnoremap          <Space>fc     :RemoveFancyCharacters<CR>
nnoremap <silent> <Space>fp     :%!prettier --stdin --stdin-filepath % --trailing-comma all<CR>
nnoremap <silent> <Space>fr     :RenameFile<CR>
nnoremap <silent> <Space>ft     :%s/\s\+$//e<CR>:let @/=''<CR>
nnoremap <silent> <Space>fw     :set wrap!<CR>
nnoremap <silent> <Space>vv     :edit $MYVIMRC<CR>

nnoremap <silent> <Space>o      :edit ~/Dropbox/Apps/todo/todo.txt<CR>
nnoremap <silent> <Space>tr     :FZF<CR>
nnoremap <silent> <Space>te     :FZF ~/
nnoremap <silent> <Space>tj     :FZF ~/Dropbox/notes<CR>
nnoremap <silent> <Space>tl     :edit ~/.ledger/current.journal<CR>zm
nnoremap <silent> <Space>tn     :FZF ~/Documents/notes<CR>

nnoremap <silent> <Space>q      :ToggleQuickfixList<CR>
nnoremap <silent> <Space>l      :ToggleLocationList<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" }}}1
