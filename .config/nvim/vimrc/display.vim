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

" left
set statusline=
set statusline+=%#error#
set statusline+=%{&modified?'[+]':''}                 " flag: modified buf
set statusline+=%*

set statusline+=%#statement#
set statusline+=%{fxn#StatuslineGitBranch()}%<        " show curr. branch
set statusline+=%*

set statusline+=%#question#
set statusline+=%r                                    " flag: read-only
set statusline+=%h                                    " flag: help
set statusline+=%w                                    " flag: preview buf
set statusline+=%*

" center
set statusline+=\ %-F\                                " absolute filepath

" right
set statusline+=%=
set statusline+=%y                                    " show filetype

" display warning if file encoding != utf-8
set statusline+=%#warningmsg#
set statusline+=%{(&fenc!='utf-8'&&&fenc!='')?'['.&fenc.']':''}
set statusline+=%*

" display warning if fileformat != unix
set statusline+=%#warningmsg#
set statusline+=%{&ff!='unix'?'['.&ff.']':''}
set statusline+=%*

set statusline+=%6(%c%)\                              " column number

" ==============================================================================
" }}}1

