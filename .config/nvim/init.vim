" general {{{1
" pathogen {{{2

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
set hidden switchbuf=useopen

" limit syntax highlighting to the first 250 columns to reduce sluggishness
set synmaxcol=250

" disable backup and swap files
set nobackup noswapfile

" automatically reload file if it has changed outside of vim
set autoread

" see ':help fold-options'
set foldenable foldlevel=0 foldcolumn=0 foldnestmax=6
set foldtext=custom#VimFoldText()

"===============================================================================
" text manipulation {{{2

" gb: fix slow O inserts
set timeout timeoutlen=1000 ttimeoutlen=100

" wrap long lines
set wrap linebreak

" backspacing wraps
set backspace=indent,eol,start

" default tab settings
set softtabstop=2 shiftwidth=2 autoindent expandtab

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
set wildmenu wildmode=list:longest,full wildignorecase

set incsearch ignorecase smartcase hlsearch

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
" visual components {{{1
" general {{{2

set title t_ti= t_te=
set t_Co=256
set cmdheight=2
set showmode

" colorscheme
set background=dark
let base16colorspace=256
colorscheme base16-eighties

" display symbols for tabs, end-of-line, trailing whitespace
set list listchars=tab:▸\ ,eol:¬,trail:@

" absolute line numbers and width to 6 chars
set number numberwidth=6

" window behavior
set winminwidth=15 winwidth=90
set noequalalways winminheight=0 winheight=9999 helpheight=9999
set splitright splitbelow

"===============================================================================
" statusline {{{2

set laststatus=2

set stl=
set stl+=%2*[%n                                 " buffer number
set stl+=%{'/'.len(filter(range(1,bufnr('$')),
    \'buflisted(v:val)'))}                      " total number of open buffers
set stl+=%H%M%R%W]%*\                           " flags
set stl+=%{custom#GitBranch()}%<                " branch of pwd if under vcs
set stl+=%-F\                                   " filepath
set stl+=%=[%{&fileformat}:                     " file format/encoding
set stl+=%{strwidth(&fenc)?&fenc:&enc}]
set stl+=%5(%c%)\                               " column number

" statusline text color
highlight default link User1 Identifier         " filename
highlight default link User2 Statement          " flags
highlight default link User3 Error              " errors

" wildmenu text and bg color; guifb/guibg is correct in my case? revisit later
highlight wildmenu guifg=#ffcc66 guibg=# gui=bold

"===============================================================================
" keymap {{{1
" misc. {{{2
"
" 'jk' exits Insert Mode
inoremap jk <Esc>

" Y yanks to EoL (consistent with D, C, etc)
nnoremap Y y$

" y yanks to system clipboard in Visual Mode
xnoremap y "*y

" toggle folds with 'zz'
nnoremap zz za
xnoremap zz zf

" keep cursor in place after joining lines
nnoremap J mzJ`z

" F8 to insert ISO 8601 timestamp + day of the week (Insert Mode)
inoremap <silent><F8> <C-r>=strftime("%FT%T%z, %a")<CR>

" hitting <cr> clears highlighting from previous search
nnoremap <silent><CR> :nohlsearch<CR>/<BS>

" tab/shift-tab to cycle through buffers
nnoremap <silent><Tab> :bnext<CR>
nnoremap <silent><S-Tab> :bprev<CR>

" search using normal regex; 'very magic'
nnoremap / /\v
xnoremap / /\v
nnoremap ? ?\v
xnoremap ? ?\v

"===============================================================================
" hjkl {{{2

" <C-h/j/k/l> for window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

vnoremap <C-h> <C-n><C-w>h
vnoremap <C-j> <C-n><C-w>j
vnoremap <C-k> <C-n><C-w>k
vnoremap <C-l> <C-n><C-w>l

inoremap <C-h> <C-\><C-n><C-w>h
inoremap <C-j> <C-\><C-n><C-w>j
inoremap <C-k> <C-\><C-n><C-w>k
inoremap <C-l> <C-\><C-n><C-w>l

cnoremap <C-h> <C-\><C-n><C-w>h
cnoremap <C-j> <C-\><C-n><C-w>j
cnoremap <C-k> <C-\><C-n><C-w>k
cnoremap <C-l> <C-\><C-n><C-w>l

tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l

"===============================================================================
" tab {{{2

" gb's multi-purpose tabs
inoremap <silent><Tab> <C-r>=custom#InsertTabWrapper()<CR>
inoremap <silent><S-Tab> <C-n>

"===============================================================================
" disable {{{2

" disable arrow keys
map <Left> <NOP>
map <Right> <NOP>
map <Up> <NOP>
map <Down> <NOP>
imap <Left> <NOP>
imap <Right> <NOP>
imap <Up> <NOP>
imap <Down> <NOP>

" hide mouse, disable it from triggering Visual Mode, page up/down
set mousehide mouse=nicr
map <MouseUp> <NOP>
map <MouseDown> <NOP>
map! <MouseUp> <NOP>
map! <MouseDown> <NOP>

"===============================================================================
" leader core {{{2

let g:mapleader="\<space>"

" gb's <leader><leader> to quickly switch to alternate buffer
nnoremap <leader><leader> <C-^>

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
" (leader-f_, mostly) finding files/buffers, file ops, dir {{{2

" pro-tip: <C-d> while using :find to show the list of files in current dir
nnoremap <leader>ff :find *
nnoremap <leader>fv :vert sfind *
nnoremap <leader>fn :find ~/Documents/notes/**/*

" find files recursively under the dir of *current* file
nnoremap <leader>F :find <C-r>=expand('%:h').'/*'<CR>
nnoremap <leader>V :vert sfind <C-r>=expand('%:h').'/*'<CR>

" list all open buffers then wait for tab completion or input + tab completion
nnoremap gb :ls<CR>:b<Space>

"===============================================================================

" leader-fr = gb's rename current file
noremap <silent><leader>fr :call custom#RenameFile()<CR>

"===============================================================================

nnoremap <silent>- :Dirvish %:p:h<CR>
nnoremap <leader>fd :Dirvish ~/

"===============================================================================
" (leader-v_) vim (general) {{{2

" leader-vm = maximize width of current window
nnoremap <silent><leader>vm <C-w>\|

" leader-vv = open .vimrc
nnoremap <silent><leader>vv :e $MYVIMRC<CR>

" leader-vw = toggle wrap and list characters
nnoremap <silent><leader>vw :set list!<CR>

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

nnoremap <silent><leader>n :UndotreeToggle<CR>

"===============================================================================
" (leader-a_) easyalign {{{2

" start interactive EasyAlign in visual mode (e.g. vip<enter>)
vmap <Enter> <Plug>(EasyAlign)

" start interactive EasyAlign for a motion/text object (e.g. <leader>aip)
nmap <leader>ab <Plug>(EasyAlign)

"===============================================================================
" }}}1

