" properly highlight tabs / trailing whitespace
highlight link UnwantedWhitespace WarningMsg
" this must be kept here, **above** the setting of colorscheme
autocmd vimrc_highlight BufEnter,WinEnter *
  \   call clearmatches()
  \|  call matchadd('UnwantedWhitespace', '\s\+$', 100)
  \|  call matchadd('UnwantedWhitespace', '\t', 100)

colorscheme acme

" statusline
" left
set statusline=
set statusline+=%#error#
set statusline+=%{statusline#BufModified()}
set statusline+=%*
set statusline+=%<                                  " truncation point
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
set statusline+=%14.(%l,%c%V%)%4p                   " line,col percent

