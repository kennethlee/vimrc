" core {{{1

set nomodeline
syntax on
filetype off

" encoding
set encoding=utf-8
scriptencoding utf-8
set fileencodings=utf-8

"===============================================================================
" vim-plug {{{1

call plug#begin('~/.nvim/plugged')

" core
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
Plug 'justinmk/vim-dirvish'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'haya14busa/incsearch.vim'
Plug 'kassio/neoterm'
Plug 'chriskempson/base16-vim'

" text-editing
Plug 'junegunn/vim-easy-align'
Plug 'Yggdroot/indentLine'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
" Plug 'mtth/locate.vim'
" Plug 'Valloric/YouCompleteMe' { 'do': './install.sh' }

" filetypes
Plug 'scrooloose/syntastic'
Plug 'othree/html5.vim'
Plug 'pangloss/vim-javascript'
Plug 'tpope/vim-rails'
Plug 'elixir-lang/vim-elixir'
" Plug 'tpope/vim-haml'

call plug#end()

"===============================================================================
" general {{{1
" file handling {{{2

" enable filetype detection
filetype plugin indent on

" hide buffers w/o having to save first.
set hidden
set switchbuf=useopen

" limit syntax highlighting to the first 250 columns to reduce sluggishness
set synmaxcol=250

" disable backup files
set nobackup
set noswapfile

" automatically reload file if it has changed outside of vim
set autoread

"===============================================================================
" text manipulation {{{2

" gb: fix slow O inserts
set timeout timeoutlen=1000 ttimeoutlen=100

" wrap long lines
set wrap linebreak

" backspacing wraps.
set backspace=indent,eol,start

" default tab settings
" set cindent
set softtabstop=4
set shiftwidth=4
set autoindent
set expandtab

" gb: insert only one space when joining lines that contain sentence-terminating
" punctuation like `.`.
set nojoinspaces

" tab completion
set wildmenu wildmode=longest,list,full

" gb: normally, Vim messes with iskeyword when you open a shell file. This can
" leak out, polluting other file types even after a 'set ft=' change. This
" variable prevents the iskeyword change so it can't hurt anyone.
let g:sh_noisk=1

"===============================================================================
" search {{{2

set incsearch
set ignorecase
set smartcase
set hlsearch
set title t_ti= t_te=

"===============================================================================
" }}}1

" source vim config files
for f in split(glob('~/.nvimrc.d/*.vim'), '\n')
    exe 'source' f
endfor

" end
