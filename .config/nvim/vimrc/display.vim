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
highlight ExtraWhitespace ctermfg=red guifg=red
match ExtraWhitespace /\s\+$\|\t/

" absolute line numbers and width to 6 chars
set number numberwidth=6

" window behavior
set noequalalways
set winminwidth=15 winwidth=90
set splitright splitbelow

"===============================================================================
" statusline {{{1

set laststatus=2

set statusline=
set statusline+=%#error#
set statusline+=%m                              " 'error' flag for modified buff
set statusline+=%*

set statusline+=%#question#
set statusline+=%h%r%w                          " help, read-only, preview buff
set statusline+=%*

set statusline+=%#statement#
set statusline+=%{fxn#GitBranch()}%<            " show curr. branch if git repo
set statusline+=%*

set statusline+=%-F\                            " absolute filepath
set statusline+=%=[%{&fileformat}:              " file format/encoding
set statusline+=%{strwidth(&fenc)?&fenc:&enc}]
set statusline+=%5(%c%)\                        " column number

"===============================================================================
" }}}1

