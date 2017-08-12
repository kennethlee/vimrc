" general {{{1

set title t_ti= t_te=
set cmdheight=2
set showmode

" colorscheme
set termguicolors
colorscheme base16-eighties
set background=dark

" display char for EoL and red chars for tabs and trailing whitespace
set list listchars=tab:▸\ ,eol:¬,trail:@
highlight SpecialKey ctermfg=196 guifg=#ff0000

" absolute line numbers and width to 6 chars
set number numberwidth=6

" window behavior
set noequalalways
set winminwidth=15 winwidth=90
set splitright splitbelow

"===============================================================================
" statusline {{{1

set laststatus=2

set stl=
set stl+=%#error#
set stl+=%m                                     " 'error' flag for modified buff.
set stl+=%*

set stl+=%#question#
set stl+=%h%r%w                                 " help, read-only, preview buff.
set stl+=%*

set stl+=%#statement#
set stl+=%{custom#GitBranch()}%<                " show curr. branch if git repo
set stl+=%*

set stl+=%-F\                                   " absolute filepath
set stl+=%=[%{&fileformat}:                     " file format/encoding
set stl+=%{strwidth(&fenc)?&fenc:&enc}]
set stl+=%5(%c%)\                               " column number

"===============================================================================
" }}}1

