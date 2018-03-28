" settings {{{1

set encoding=utf-8
scriptencoding utf-8
set fileencodings=utf-8

set nomodeline
set clipboard+=unnamedplus
filetype plugin indent on
syntax on
set runtimepath+=~/.fzf

set autoread
set backspace=indent,eol,start
set cmdheight=2
set cmdwinheight=20
set expandtab
set foldmethod=manual
set foldopen-=block
set foldtext=fold#HeaderText()
set hidden
set hlsearch
set ignorecase
set inccommand=nosplit
set incsearch
set laststatus=2
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
set synmaxcol=250
set tabstop=2
set termguicolors
set timeout
set timeoutlen=500
set title t_ti= t_te=
set ttimeoutlen=100
set wildignorecase
set wildmenu
set wildmode=list:longest,full
set winwidth=90 winminwidth=40
set wrap

" gb: normally, Vim messes with iskeyword when you open a shell file. This can
" leak out, polluting other file types even after a 'set ft=' change. This
" variable prevents the iskeyword change so it can't hurt anyone
let g:sh_noisk = 1

if executable('rg')
  set grepprg=rg\ --vimgrep\ --no-heading
  set grepformat=%f:%l:%c:%m,%f:%l:%m
endif

" ==============================================================================
" commands {{{1

" `:WipeMarks` to clear marks
command! WipeMarks delmarks! | delmarks A-Z0-9

" `:WipeReg` to clear registers
command! WipeReg for i in range(34,122)
  \| silent! call setreg(nr2char(i), [])
  \| endfor

" ==============================================================================
" }}}1

