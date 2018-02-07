" general {{{1

set title t_ti= t_te=
set termguicolors

set cmdheight=2
set showmode
set number numberwidth=5

syntax on
set list listchars=tab:▸\ ,eol:¬,trail:@

highlight link UnwantedWhitespace WarningMsg

" this augroup must be kept here, *above* the setting of colorscheme
augroup highlight_whitespace
  autocmd!
  autocmd WinEnter,BufEnter * call clearmatches()
    \| call matchadd('UnwantedWhitespace', '\s\+$', 100)
    \| call matchadd('UnwantedWhitespace', '\t', 100)
augroup END

colorscheme acme

" ==============================================================================
" statusline {{{1

set laststatus=2

" left
set statusline=
set statusline+=%#error#
set statusline+=%{&modified?'[+]':''}                           " modified buf
set statusline+=%*

set statusline+=%#question#
set statusline+=%r                                              " read-only
set statusline+=%w                                              " preview buf
set statusline+=%*

" center
set statusline+=\ %-F\                                          " absolute path

" right
set statusline+=%=
set statusline+=%y                                              " filetype

set statusline+=%#warningmsg#
set statusline+=%{fxn#StatuslineWarningWhitespace()}            " whitespace
set statusline+=%{&expandtab?'':'[noet]'}                       " noexpandtab
set statusline+=%{(&fenc!='utf-8'&&&fenc!='')?'['.&fenc.']':''} " file encoding
set statusline+=%{&fileformat!='unix'?'['.&fileformat.']':''}   " file format
set statusline+=%*

set statusline+=%6(%c%)\                                        " column number

" ==============================================================================
" }}}1

