" disable {{{1

" disable arrow keys
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>
imap <Left> <Nop>
imap <Right> <Nop>
imap <Up> <Nop>
imap <Down> <Nop>

" hide mouse, disable it from triggering Visual Mode, page up/down
set mousehide mouse=nicr
map <MouseUp> <Nop>
map <MouseDown> <Nop>
map! <MouseUp> <Nop>
map! <MouseDown> <Nop>

" ==============================================================================
" misc. {{{1

" 'jk' exits Insert Mode
inoremap jk <Esc>

" map '6' to '^' to avoid having to press shift
nnoremap 6 ^

" 'Y' yanks to EoL (consistent with D, C, etc)
nnoremap Y y$

" 'y' yanks to system clipboard in Visual Mode
xnoremap y "*y

" toggle folds with 'zz'
nnoremap zz za
xnoremap zz zf

" keep cursor in place after joining lines
nnoremap J mzJ`z

" 'gV' to select last changed block
nnoremap gV `[v`]

" 'F8' to insert ISO 8601 timestamp + day of the week (Insert Mode)
inoremap <silent><F8> <C-r>=strftime("%FT%T%z, %a")<CR>

" hitting <CR> clears highlighting from previous search
nnoremap <silent><CR> :nohlsearch<CR>/<BS>

" ==============================================================================
" <Leader> {{{1

nnoremap <Space> <Nop>
let g:mapleader = "\<Space>"

" ==============================================================================
" <Leader>c: change {{{1

" use leader key before change/delete command to delete without yanking
" also forbid deletion via x from updating registers
nnoremap <Leader>C "_C
xnoremap <Leader>C "_C
nnoremap <Leader>c "_c
xnoremap <Leader>c "_c
nnoremap <Leader>D "_D
xnoremap <Leader>D "_D
nnoremap <Leader>d "_d
xnoremap <Leader>d "_d
noremap x "_x

" ==============================================================================
" <Leader>f: file ops {{{1

" run make
nnoremap <Leader>fm :make! %<CR>
nnoremap <Leader>fM :make! *.

" strip whitespace
nnoremap <silent><Leader>ft :%s/\s\+$//<CR>:let @/=''<CR>

" rename current file
nnoremap <silent><Leader>fr :call autofxn#RenameFile()<CR>

" ==============================================================================
" <Leader>g: gitgutter {{{1

nmap <Leader>gs <Plug>GitGutterStageHunk
nmap <Leader>gu <Plug>GitGutterUndoHunk
nmap <Leader>gp <Plug>GitGutterPreviewHunk

" ==============================================================================
" <Leader>n: undotree {{{1

nnoremap <silent><Leader>n :UndotreeToggle<CR>

" ==============================================================================
" <Leader>t: fzf {{{1

nnoremap <silent><Leader>tr :Files<CR>
nnoremap <Leader>te :Files ~/
nnoremap <silent><Leader>tl :BLines<CR>
nnoremap <silent><Leader>tk :Lines<CR>
nnoremap <silent><Leader>tu :Buffers<CR>
nnoremap <silent><Leader>tn :Files ~/Documents/notes<CR>
nnoremap <silent><Leader>tj :Files ~/Dropbox/notes<CR>
nnoremap <silent><Leader>ta :Files ~/Dropbox/apps/todo<CR>

" ==============================================================================
" <Leader>v: general vim {{{1

" maximize width of current window
nnoremap <silent><Leader>vm <C-w>\|

" open .vimrc
nnoremap <silent><Leader>vv :e ~/.config/nvim/vimrc<CR>

" ==============================================================================
" navigation {{{1
" nav: window {{{2

" <C-h/j/k/l> for window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

vnoremap <C-h> <C-n><C-w>h
vnoremap <C-j> <C-n><C-w>j
vnoremap <C-k> <C-n><C-w>k
vnoremap <C-l> <C-n><C-w>l

tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l

" ==============================================================================
" nav: buffer {{{2

" <Leader><Leader> to switch to the alternate buffer
nnoremap <Leader><Leader> <C-^>

" list all open buffers then wait for tab completion or input + tab completion
nnoremap <Leader>bb :ls<CR>:b *
nnoremap <Leader>bs :ls<CR>:sbuffer *

" cycle through buffers
nnoremap <silent><Leader>h :bprevious<CR>
nnoremap <silent><Leader>l :bnext<CR>

" ==============================================================================
" nav: quickfix {{{2

" toggle quickfix window
nnoremap <silent><Leader>q :call autofxn#QuickfixToggle()<CR>

" cycle through items in the quickfix list
nnoremap <silent><Leader>k :cprevious<CR>
nnoremap <silent><Leader>j :cnext<CR>

" ==============================================================================
" nav: misc. {{{2

" dirvish
nnoremap <silent>- :Dirvish %:p:h<CR>
nnoremap <Leader>fd :Dirvish ~/

" jump to/from lines with same indentation level
nnoremap <silent>_ :call fxn#NextIndent(0, 0, 0, 1)<CR>
nnoremap <silent>+ :call fxn#NextIndent(0, 1, 0, 1)<CR>
vnoremap <silent>_ <Esc>:call fxn#NextIndent(0, 0, 0, 1)<CR>m'gv''
vnoremap <silent>+ <Esc>:call fxn#NextIndent(0, 1, 0, 1)<CR>m'gv''
onoremap <silent>_ :call fxn#NextIndent(0, 0, 0, 1)<CR>
onoremap <silent>+ :call fxn#NextIndent(0, 1, 0, 1)<CR>

" ==============================================================================
" ultisnips {{{1

let g:UltiSnipsExpandTrigger = '<Tab>'
let g:UltiSnipsJumpForwardTrigger = '<Tab>'
let g:UltiSnipsJumpBackwardTrigger = '<S-Tab>'

" ==============================================================================
" html tag completion {{{1

" inline tag
inoremap <C-j> ><Esc>F<lyiwf>a</<Esc>pa><Esc>F<i

" block tag
inoremap <C-k> ><Esc>F<lyiwo</<C-r>"><Esc>O

" ==============================================================================
" turbo-charged dot {{{1

" 'cN/cn' on current word, change, dot repeat, be amazed
nnoremap cN #``cgN
nnoremap cn *``cgn

" 'cn' on visually-selected text, change, dot repeat
" hit 'N/n' to jump to previous/next occurrence per the usual
let g:mc = "y/\\V\<C-r>=escape(@\", '/')\<CR>\<CR>"
vnoremap <expr> cn g:mc . "``cgn"

" ==============================================================================
" }}}1

