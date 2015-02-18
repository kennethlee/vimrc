" General {{{1

set t_Co=256
set cmdheight=2
set showmode

" Display symbols for tabs, EOLs, trailing whitespace
set list
set listchars=tab:▸\ ,eol:¬,trail:@

" Absolute line numbers and width to 6 chars.
set number
set numberwidth=6

" Window Behavior
set winminwidth=15
set winwidth=80
set winheight=5
set winminheight=5
set winheight=999
set splitright splitbelow

" Status Line {{{1

" Current line in netrw/CtrlP now yellow highlight/black text
hi CursorLine cterm=NONE ctermbg=yellow ctermfg=black

set laststatus=2

hi default link User1 Identifier                " Filename
hi default link User2 Statement                 " Flags
hi default link User3 Error                     " Errors

set stl=
set stl+=%2*[%n                                 " Buffer number
set stl+=%{'/'.len(filter(range(1,bufnr('$')),
    \'buflisted(v:val)'))}                      " Total number of open buffers
set stl+=%H%M%R%W]%*\                           " Flags
set stl+=%{fugitive#statusline()}%<             " fugitive branch
set stl+=%-F\                                   " Filepath
set stl+=%=[%{&fileformat}:                     " File format/encoding
set stl+=%{strwidth(&fenc)?&fenc:&enc}]
set stl+=%5(%c%)\                               " Column number

" Hide {{{1

set guioptions=aAce
set mousehide

" }}}1
