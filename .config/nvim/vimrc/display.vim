" general {{{1

set title t_ti= t_te=
set termguicolors

set cmdheight=2
set showmode
set number numberwidth=5

syntax on
set list listchars=tab:▸\ ,eol:¬,trail:@

highlight link UnwantedWhitespace WarningMsg

augroup highlight_whitespace
  autocmd!
  autocmd WinEnter,BufEnter * call clearmatches()
    \| call matchadd('UnwantedWhitespace', '\s\+$', 100)
    \| call matchadd('UnwantedWhitespace', '\t', 100)
augroup END

colorscheme base16-eighties

" ==============================================================================
" statusline {{{1

set laststatus=2

" left
set statusline=
set statusline+=%#error#
set statusline+=%{&modified?'[+]':''}                 " flag: modified buf
set statusline+=%*

set statusline+=%#question#
set statusline+=%r                                    " flag: read-only
set statusline+=%w                                    " flag: preview buf
set statusline+=%*

" center
set statusline+=\ %-F\                                " absolute filepath

" right
set statusline+=%=
set statusline+=%y                                    " show filetype

set statusline+=%#warningmsg#
set statusline+=%{fxn#StatuslineWarningWhitespace()}
set statusline+=%*

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

