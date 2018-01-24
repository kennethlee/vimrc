" paths {{{1

set runtimepath+=~/.fzf

" ==============================================================================
" file handling {{{1

set nomodeline

" encoding
set encoding=utf-8
scriptencoding utf-8
set fileencodings=utf-8

" enable filetype detection
filetype plugin indent on

" hide buffers w/o having to save first
set hidden switchbuf=useopen

" limit syntax highlighting to the first 250 columns to reduce sluggishness
set synmaxcol=250

" disable backup and swap files
set nobackup noswapfile

" automatically reload file if it has changed outside of vim
set autoread

set foldmethod=manual
set nofoldenable

" jump over folds without opening them
set foldopen-=block

" ==============================================================================
" text manipulation {{{1

set clipboard+=unnamedplus

" gb: fix slow O inserts
set timeout
set timeoutlen=500
set ttimeoutlen=100

" wrap long lines
set wrap linebreak

" backspacing wraps
set backspace=indent,eol,start

" default tab settings
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2

" gb: insert only one space when joining lines that contain sentence-terminating
" punctuation like `.`.
set nojoinspaces

" gb: normally, Vim messes with iskeyword when you open a shell file. This can
" leak out, polluting other file types even after a 'set ft=' change. This
" variable prevents the iskeyword change so it can't hurt anyone
let g:sh_noisk = 1

" ==============================================================================
" window behavior {{{1

set noequalalways
set winwidth=90
set winminwidth=40
set splitright splitbelow

" ==============================================================================
" search / find {{{1

set incsearch
set ignorecase
set smartcase
set hlsearch

" incremental substitution
set inccommand=nosplit

if executable('rg')
  set grepprg=rg\ --vimgrep\ --no-heading
  set grepformat=%f:%l:%c:%m,%f:%l:%m
endif

" ==============================================================================
" registers {{{1

" `:WipeReg` to clear registers
command! WipeReg for i in range(34,122)
  \| silent! call setreg(nr2char(i), [])
  \| endfor

" call `WipeReg` on quit
autocmd VimEnter * WipeReg

" ==============================================================================
" completion {{{1

" command mode tab completion
set wildmenu
set wildmode=list:longest,full
set wildignorecase

" ==============================================================================
" }}}1

