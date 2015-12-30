" general {{{1
" first {{{2

" infect!
" run :Helptags command after installs to make the plugin's docs avail. globally
execute pathogen#infect()

" fzf
set rtp+=~/.fzf

"===============================================================================
" file handling {{{2

set nomodeline
syntax on

" encoding
set encoding=utf-8
scriptencoding utf-8
set fileencodings=utf-8

" enable filetype detection
filetype plugin indent on

" hide buffers w/o having to save first
set hidden
set switchbuf=useopen

" limit syntax highlighting to the first 250 columns to reduce sluggishness
set synmaxcol=250

" disable backup files
set nobackup
set noswapfile

" automatically reload file if it has changed outside of vim
set autoread

"===============================================================================
" text manipulation {{{2

" gb: fix slow O inserts
set timeout timeoutlen=1000 ttimeoutlen=100

" wrap long lines
set wrap linebreak

" backspacing wraps
set backspace=indent,eol,start

" default tab settings
set softtabstop=2
set shiftwidth=2
set autoindent
set expandtab

" gb: insert only one space when joining lines that contain sentence-terminating
" punctuation like `.`.
set nojoinspaces

" gb: normally, Vim messes with iskeyword when you open a shell file. This can
" leak out, polluting other file types even after a 'set ft=' change. This
" variable prevents the iskeyword change so it can't hurt anyone
let g:sh_noisk=1

"===============================================================================
" search/find {{{2

" allows for finding of files recursively under pwd using :find/:sfind
set path=.,**

" tab completion
set wildmenu
set wildmode=list:longest,full
set wildignorecase

set incsearch
set ignorecase
set smartcase
set hlsearch
set title t_ti= t_te=

"===============================================================================
" wildignore {{{2

" ignore when using :find
set wildignore+=*.avi,*.m3u,*.mp3,*.mp4,*.mpg,*.wmv
set wildignore+=*.bmp,*.gif,*.ico,*.jpeg,*.jpg,*.png
set wildignore+=*.doc,*.numbers,*.pages,*.pdf
set wildignore+=*.dmg,*.gz,*.rar,*.tbz,*.zip
set wildignore+=*/tmp/*,*.db,*DS_Store,*.log
set wildignore+=*.so,*.sw?

"===============================================================================
" plugin config {{{1
" neomake {{{2

" makers
let g:neomake_ruby_enabled_makers=['rubocop']
let g:neomake_javascript_enabled_makers = ['eslint']

autocmd! BufWritePost * Neomake

"===============================================================================
" undotree {{{2

" if set, let undotree window get focus after being opened, otherwise
" focus will stay in current window
if !exists('g:undotree_SetFocusWhenToggle')
  let g:undotree_SetFocusWhenToggle = 1
endif

" highlight changed text
if !exists('g:undotree_HighlightChangedText')
  let g:undotree_HighlightChangedText = 1
endif

"===============================================================================
" vim-gitgutter {{{2

let g:gitgutter_eager = 0
let g:gitgutter_sign_column_always = 1
highlight clear SignColumn

"===============================================================================
" misc. {{{2

" disable netrw
let g:loaded_netrwPlugin = 1

"===============================================================================
" functions {{{1
" fold lines {{{2

" better looking folds; right-alignment of line numbers + percentage of file
function! VimFoldText()
  let fs = v:foldstart

  while getline(fs) =~ '^\s*$'
    let fs = nextnonblank(fs + 1)
  endwhile

  if fs > v:foldend
    let line = getline(v:foldstart)
  else
    let line = getline(fs)
  endif

  let line = " " . substitute(line, '/\*\|\*/\|{'.'{{\d\=', '', 'g') . " "
  let w = winwidth(0) - &foldcolumn - (&number ? 8 : 0)
  let foldSize = 1 + v:foldend - v:foldstart
  let foldSizeStr = " " . foldSize . " lines "
  let foldLevelStr = repeat(" + ", v:foldlevel) . "[" . v:foldlevel . "]"
  let lineCount = line("$")
  let foldPercentage = "[" . printf("%4.1f", (foldSize*1.0)/lineCount*100)
      \. "%] "
  let expansionString = repeat(".", w - strwidth(foldSizeStr) - strwidth(line)
      \- strwidth(foldLevelStr) - strwidth(foldPercentage))
  return foldLevelStr . line . expansionString . foldSizeStr. foldPercentage
endfunction

set foldtext=VimFoldText()

"===============================================================================
" global options {{{3

" see ':help fold-options'
set foldenable
set foldlevel=0
set foldcolumn=0
set foldnestmax=6

"===============================================================================
" gb's rename file {{{2

function! RenameFile()
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'), 'file')

  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' . old_name
    redraw!
  endif
endfunction

"===============================================================================
" gb's tabs {{{2

" indent if at the beginning of a line, else, do completion
function! InsertTabWrapper()
  let col = col('.') - 1
  if !col || getline('.')[col - 1] !~ '\k'
    return "\<Tab>"
  else
    return "\<C-p>"
  endif
endfunction

"===============================================================================
" pastetoggle {{{2

" 'bracketed paste mode': enables the terminal emulator to tell the program
" connected to the tty when the user pastes text, so that the program won't
" interpret it as editing commands."
if &term =~ "xterm.*"
  let &t_ti = &t_ti . "\e[?2004h"
  let &t_te = "\e[?2004l" . &t_te

  function XTermPasteBegin(ret)
    set pastetoggle=<Esc>[201~
    set paste
    return a:ret
  endfunction

  map <expr> <Esc>[200~ XTermPasteBegin("i")
  imap <expr> <Esc>[200~ XTermPasteBegin("")
  cmap <Esc>[200~ <nop>
  cmap <Esc>[201~ <nop>
endif

"===============================================================================
" gui {{{1
" general {{{2

set t_Co=256
set cmdheight=2
set showmode

" colorscheme
set background=dark
let base16colorspace=256
colorscheme base16-eighties

" display symbols for tabs, end-of-line, trailing whitespace
set list
set listchars=tab:▸\ ,eol:¬,trail:@

" absolute line numbers and width to 6 chars
set number
set numberwidth=6

" window behavior
set winminwidth=15 winwidth=90
set noequalalways winminheight=0 winheight=9999 helpheight=9999
set splitright splitbelow

"===============================================================================
" statusline {{{2

" current line in netrw now yellow highlight/black text
" hi CursorLine cterm=NONE ctermbg=yellow ctermfg=black

set laststatus=2

hi default link User1 Identifier                " filename
hi default link User2 Statement                 " flags
hi default link User3 Error                     " errors

" show git branch of current file if it's under version control
function! GitBranch()
  " stores current working directory
  let lastdir = getcwd()
  " changes temporarily to the directory containing the buffer
  let bufdir = expand('%:p:h')
  if bufdir != lastdir
    lcd `=bufdir`
  endif
  " retrieves git branch after changing directory
  let branch = system("git branch --no-color 2> /dev/null | cut -d' ' -f2")
  " then changes back
  if bufdir != lastdir
    lcd `=lastdir`
  endif

  if branch != ''
    return 'GIT(' . substitute(branch, '\n', '', 'g') . ')'
  endif
  return ''
endfunction

augroup gitbranch
  autocmd!
  autocmd BufRead,BufNewFile * let b:gitbranch=GitBranch()
augroup END

set stl=
set stl+=%2*[%n                                 " buffer number
set stl+=%{'/'.len(filter(range(1,bufnr('$')),
    \'buflisted(v:val)'))}                      " total number of open buffers
set stl+=%H%M%R%W]%*\                           " flags
set stl+=%{GitBranch()}%<                       " branch of pwd if under vcs
set stl+=%-F\                                   " filepath
set stl+=%=[%{&fileformat}:                     " file format/encoding
set stl+=%{strwidth(&fenc)?&fenc:&enc}]
set stl+=%5(%c%)\                               " column number

"===============================================================================
" hide {{{2

set guioptions=aAce
set mousehide

"===============================================================================
" keymap {{{1
" misc. {{{2
"
" 'jk' exits Insert Mode
inoremap jk <esc>

" Y yanks to EoL (consistent with D, C, etc)
nnoremap Y y$

" y yanks to system clipboard in Visual Mode
xnoremap y "*y

" toggle folds with <space>
nnoremap zz za
xnoremap zz zf

" keep cursor in place after joining lines
nnoremap J mzJ`z

" F8 to insert ISO 8601 timestamp + day of the week (Insert Mode)
inoremap <silent><f8> <c-r>=strftime("%FT%T%z, %a")<cr>

" hitting 'jk', <cr>, or <esc> clears highlighting from previous search
nnoremap <silent><cr> :nohlsearch<cr>/<bs>
nnoremap <silent><esc> :nohlsearch<cr>/<bs>

" tab/shift-tab to cycle through buffers
nnoremap <silent><tab> :bnext<cr>
nnoremap <silent><s-tab> :bprev<cr>

" search using normal regex; 'very magic'
nnoremap / /\v
xnoremap / /\v
nnoremap ? ?\v
xnoremap ? ?\v

"===============================================================================
" change dir {{{2

" change dir across vim session
nnoremap cD :cd %:p:h<bar>pwd<cr>
nnoremap cU :cd ..<bar>pwd<cr>

" change dir of curent window
nnoremap cd :lcd %:p:h<bar>pwd<cr>
nnoremap cu :lcd ..<bar>pwd<cr>

"===============================================================================
" hjkl {{{2

" <ctrl>-h/j/k/l for window navigation
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

vnoremap <c-h> <c-n><c-w>h
vnoremap <c-j> <c-n><c-w>j
vnoremap <c-k> <c-n><c-w>k
vnoremap <c-l> <c-n><c-w>l

inoremap <c-h> <c-\><c-n><c-w>h
inoremap <c-j> <c-\><c-n><c-w>j
inoremap <c-k> <c-\><c-n><c-w>k
inoremap <c-l> <c-\><c-n><c-w>l

cnoremap <c-h> <c-\><c-n><c-w>h
cnoremap <c-j> <c-\><c-n><c-w>j
cnoremap <c-k> <c-\><c-n><c-w>k
cnoremap <c-l> <c-\><c-n><c-w>l

tnoremap <c-h> <c-\><c-n><c-w>h
tnoremap <c-j> <c-\><c-n><c-w>j
tnoremap <c-k> <c-\><c-n><c-w>k
tnoremap <c-l> <c-\><c-n><c-w>l

"===============================================================================
" tab {{{2

" gb's multi-purpose tabs
inoremap <silent><tab> <c-r>=InsertTabWrapper()<cr>
inoremap <silent><s-tab> <c-n>

"===============================================================================
" disable {{{2

" disable arrow keys
map <left> <nop>
map <right> <nop>
map <up> <nop>
map <down> <nop>
imap <left> <nop>
imap <right> <nop>
imap <up> <nop>
imap <down> <nop>

" hide mouse, disable it from triggering Visual Mode, page up/down
set mousehide mouse=nicr
map <mouseup> <nop>
map <mousedown> <nop>
map! <mouseup> <nop>
map! <mousedown> <nop>

"===============================================================================
" leader core {{{2

let g:mapleader="\<space>"

" gb's <leader><leader> to quickly switch to alternate buffer
nnoremap <leader><leader> <c-^>

"===============================================================================
" (leader-c_) change {{{2

" use leader key before change/delete command to delete without yanking
" also forbid deletion via x from updating registers
nnoremap <leader>C "_C
xnoremap <leader>C "_C
nnoremap <leader>c "_c
xnoremap <leader>c "_c
nnoremap <leader>D "_D
xnoremap <leader>D "_D
nnoremap <leader>d "_d
xnoremap <leader>d "_d
noremap x "_x

"===============================================================================
" (leader-f_) file ops, dirvish {{{2

" pro-tip: <c-d> while using :find to show the list of files in current dir
nnoremap <leader>ff :find *
nnoremap <leader>fv :vert sfind *

"===============================================================================

" leader-fr = gb's rename current file
noremap <silent><leader>fr :call RenameFile()<cr>

"===============================================================================

nnoremap <silent>- :Dirvish %:p:h<cr>
nnoremap <leader>fd :Dirvish ~/

"===============================================================================
" (leader-v_) vim (general) {{{2

" leader-vm = maximize width of current window
nnoremap <silent><leader>vm <c-w>\|

" leader-vs = toggle spell check
nnoremap <silent><leader>vs :call SpellToggle()<cr>

" leader-vv = open .vimrc
nnoremap <silent><leader>vv :e $MYVIMRC<cr>

" leader-vw = toggle wrap and list characters
nnoremap <silent><leader>vw :set list!<cr>

"===============================================================================
" (leader-t_) fzf {{{2

nnoremap <silent><leader>tt :Files<cr>
nnoremap <leader>te :Files ~/
nnoremap <silent><leader>tk :BLines<cr>
nnoremap <silent><leader>tl :Lines<cr>
nnoremap <silent><leader>tu :Buffers<cr>
nnoremap <silent><leader>tm :History<cr>
nnoremap <silent><leader>tn :Files ~/Documents/notes<cr>

"===============================================================================
" (leader-n_) undotree {{{2

nnoremap <silent><leader>n :UndotreeToggle<cr>

"===============================================================================
" (leader-a_) easyalign {{{2

" start interactive EasyAlign in visual mode (e.g. vip<enter>)
vmap <enter> <Plug>(EasyAlign)

" start interactive EasyAlign for a motion/text object (e.g. <leader>aip)
nmap <leader>ab <Plug>(EasyAlign)

"===============================================================================
" }}}1

