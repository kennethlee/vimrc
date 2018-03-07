" general {{{1

set title t_ti= t_te=
set termguicolors

set cmdheight=2
set showmode
set number numberwidth=5

syntax on
set list listchars=tab:▸\ ,eol:¬,trail:@

highlight link UnwantedWhitespace WarningMsg

" this must be kept here, *above* the setting of colorscheme
autocmd settings_highlight BufEnter,WinEnter * call clearmatches()
  \| call matchadd('UnwantedWhitespace', '\s\+$', 100)
  \| call matchadd('UnwantedWhitespace', '\t', 100)

colorscheme acme

" ==============================================================================
" statusline {{{1

set laststatus=2

" left
set statusline=
set statusline+=%#error#
set statusline+=%{statusline#BufModified()}
set statusline+=%*

set statusline+=%#question#
set statusline+=%r                                  " read-only
set statusline+=%w                                  " preview buf
set statusline+=%*

" center
set statusline+=\ %-F\                              " absolute path

" right
set statusline+=%=
set statusline+=%y                                  " filetype

set statusline+=%#warningmsg#
set statusline+=%{statusline#WarningWhitespace()}
set statusline+=%{statusline#ExpandTab()}
set statusline+=%{statusline#FileEncoding()}
set statusline+=%{statusline#FileFormat()}
set statusline+=%*

set statusline+=%6(%c%)\                            " column number

" ==============================================================================
" }}}1

