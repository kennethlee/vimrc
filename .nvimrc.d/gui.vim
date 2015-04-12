" general {{{1

set t_Co=256
set cmdheight=2
set showmode

" colorscheme
" necessary for proper color but still overridden by terminal; is this normal?
set background=dark
let base16colorspace=256
colorscheme base16-eighties

" display symbols for tabs, end-of-line, trailing whitespace
set list
set listchars=tab:▸\ ,eol:¬,trail:@

" absolute line numbers and width to 6 chars.
set number
set numberwidth=6

" window behavior
set winminwidth=15 winwidth=90
set noequalalways winminheight=0 winheight=9999 helpheight=9999
set splitright splitbelow

"===============================================================================
" status line {{{1

" current line in netrw now yellow highlight/black text
hi CursorLine cterm=NONE ctermbg=yellow ctermfg=black

set laststatus=2

hi default link User1 Identifier                " filename
hi default link User2 Statement                 " flags
hi default link User3 Error                     " errors

set stl=
set stl+=%2*[%n                                 " buffer number
set stl+=%{'/'.len(filter(range(1,bufnr('$')),
    \'buflisted(v:val)'))}                      " total number of open buffers
set stl+=%H%M%R%W]%*\                           " flags
set stl+=%{exists('g:loaded_fugitive')?fugitive#statusline():''}%<
set stl+=%-F\                                   " filepath
set stl+=%=[%{&fileformat}:                     " file format/encoding
set stl+=%{strwidth(&fenc)?&fenc:&enc}]
set stl+=%5(%c%)\                               " column number

"===============================================================================
" hide {{{1

set guioptions=aAce
set mousehide

"===============================================================================
" }}}1
