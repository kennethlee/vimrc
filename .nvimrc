" Core {{{1

set nomodeline
syntax on
filetype off

" Encoding
set encoding=utf-8
scriptencoding utf-8
set fileencodings=utf-8

" vim-plug {{{1

call plug#begin('~/.nvim/plugged')

" Core
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
Plug 'justinmk/vim-dirvish'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'gelguy/Cmd2.vim'
Plug 'haya14busa/incsearch.vim'

Plug 'ctrlpvim/ctrlp.vim'
Plug 'FelikZ/ctrlp-py-matcher'

" Text-editing
Plug 'junegunn/vim-easy-align'
Plug 'Yggdroot/indentLine'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
" Plug 'mtth/locate.vim'
" Plug 'Valloric/YouCompleteMe' { 'do': './install.sh' }

" Filetypes
Plug 'scrooloose/syntastic'
Plug 'othree/html5.vim'
Plug 'pangloss/vim-javascript'
Plug 'tpope/vim-rails'
Plug 'elixir-lang/vim-elixir'
" Plug 'tpope/vim-haml'

call plug#end()

" General {{{1
"===============================================================================
" File Handling {{{2
"===============================================================================

" Enable filetype detection
filetype plugin indent on

" Hide buffers w/o having to save first.
set hidden
set switchbuf=useopen

" Limit syntax highlighting to the first 250 columns to reduce sluggishness
set synmaxcol=250

" Disable backup files
set nobackup
set noswapfile

" Automatically reload file if it has changed outside of vim
set autoread

"===============================================================================
" Text Manipulation {{{2
"===============================================================================

" GB: fix slow O inserts
set timeout timeoutlen=1000 ttimeoutlen=100

" Wrap long lines
set wrap linebreak

" Backspacing wraps.
set backspace=indent,eol,start

" Default tab settings
" set cindent
set softtabstop=4
set shiftwidth=4
set autoindent
set expandtab

" GB: insert only one space when joining lines that contain sentence-terminating
" punctuation like `.`.
set nojoinspaces

" Tab completion
set wildmenu wildmode=longest,list,full

" GB: normally, Vim messes with iskeyword when you open a shell file. This can
" leak out, polluting other file types even after a 'set ft=' change. This
" variable prevents the iskeyword change so it can't hurt anyone.
let g:sh_noisk=1

"===============================================================================
" Search {{{2
"===============================================================================

set incsearch
set ignorecase
set smartcase
set hlsearch
set title t_ti= t_te=

" }}}1

" Source vim config files
for f in split(glob('~/.nvimrc.d/*.vim'), '\n')
    exe 'source' f
endfor

" End
