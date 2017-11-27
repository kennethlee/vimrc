" paths {{{1

set rtp+=~/.fzf

"===============================================================================
" file handling {{{1

set nomodeline
syntax on

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

" see ':help fold-options'
set foldenable foldlevel=0 foldcolumn=0 foldnestmax=6
set foldtext=custom#VimFoldText()

" jump over folds without opening them
set foldopen-=block

"===============================================================================
" text manipulation {{{1

" gb: fix slow O inserts
set timeout timeoutlen=1000 ttimeoutlen=100

" wrap long lines
set wrap linebreak

" backspacing wraps
set backspace=indent,eol,start

" default tab settings
set softtabstop=2 shiftwidth=2 autoindent expandtab

" gb: insert only one space when joining lines that contain sentence-terminating
" punctuation like `.`.
set nojoinspaces

" gb: normally, Vim messes with iskeyword when you open a shell file. This can
" leak out, polluting other file types even after a 'set ft=' change. This
" variable prevents the iskeyword change so it can't hurt anyone
let g:sh_noisk=1

"===============================================================================
" search/find {{{1

" set incremental substitution
set inccommand=nosplit

" allows for finding of files recursively under pwd using :find/:sfind
set path=.,**

" tab completion
set wildmenu wildmode=list:longest,full wildignorecase

set incsearch ignorecase smartcase hlsearch

"===============================================================================
" wildignore {{{1

" ignore when using :find
set wildignore+=*.avi,*.m3u,*.mp3,*.mp4,*.mpg,*.wmv
set wildignore+=*.bmp,*.gif,*.ico,*.jpeg,*.jpg,*.png
set wildignore+=*.doc,*.numbers,*.pages,*.pdf
set wildignore+=*.dmg,*.gz,*.rar,*.tbz,*.zip
set wildignore+=*/tmp/*,*.db,*DS_Store,*.log
set wildignore+=*.so,*.sw?

"===============================================================================
" }}}1

source $HOME/.config/nvim/vimrc/plugin.vim
source $HOME/.config/nvim/vimrc/visual.vim
source $HOME/.config/nvim/vimrc/keymap.vim

