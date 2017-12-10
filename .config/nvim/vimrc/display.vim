" general {{{1

set title t_ti= t_te=
set termguicolors

set cmdheight=2
set showmode
set number numberwidth=5

syntax on
set list listchars=tab:▸\ ,eol:¬,trail:@

" Colorschemes usually reset all highlighting, including your own, when they
" are sourced. Override the desired highlights in an autocommand that is
" executed whenever a colorscheme is sourced.
augroup extra_whitespace
  autocmd!
  autocmd ColorScheme * highlight ExtraWhitespace ctermfg=red guifg=red
  autocmd ColorScheme * match ExtraWhitespace /\s\+$\|\t/
augroup END

" colorscheme
colorscheme base16-eighties
set background=dark

" ==============================================================================
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

" ==============================================================================
" }}}1

