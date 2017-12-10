" disable {{{1

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

" ==============================================================================
" leader core {{{1

let g:mapleader = "\<Space>"

" ==============================================================================
" (leader-c_) change {{{1

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

" ==============================================================================
" (leader-f_, mostly) finding files/buffers, file ops, dir {{{1

" <leader><leader> to switch to the alternate buffer
nnoremap <leader><leader> <C-^>

" ======================================

" list all open buffers then wait for tab completion or input + tab completion
nnoremap gb :ls<CR>:b<Space>

" SL's trailing whitespace cleaner
noremap <silent><leader>ft :%s/\s\+$//<CR>:let @/=''<CR>

" leader-fr = gb's rename current file
noremap <silent><leader>fr :call autofxn#RenameFile()<CR>

nnoremap <silent>- :Dirvish %:p:h<CR>
nnoremap <leader>fd :Dirvish ~/

" ==============================================================================
" (leader-t_) fzf {{{1

nnoremap <silent><leader>tr :Files<CR>
nnoremap <leader>te :Files ~/
nnoremap <silent><leader>tl :BLines<CR>
nnoremap <silent><leader>tk :Lines<CR>
nnoremap <silent><leader>tu :Buffers<CR>
nnoremap <silent><leader>tn :Files ~/Documents/notes<CR>
nnoremap <silent><leader>tj :Files ~/Dropbox/notes<CR>
nnoremap <silent><leader>ta :Files ~/Dropbox/apps/todo<CR>

" ==============================================================================
" (leader-v_) vim (general) {{{1

" leader-vm = maximize width of current window
nnoremap <silent><leader>vm <C-w>\|

" leader-vv = open .vimrc
nnoremap <silent><leader>vv :e ~/.config/nvim/vimrc<CR>

" ==============================================================================
" (leader-n_) undotree {{{1

nnoremap <silent><leader>u :UndotreeToggle<CR>

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

" 'F8' to insert ISO 8601 timestamp + day of the week (Insert Mode)
inoremap <silent><F8> <C-r>=strftime("%FT%T%z, %a")<CR>

" hitting <CR> clears highlighting from previous search
nnoremap <silent><CR> :nohlsearch<CR>/<BS>

" ==============================================================================
" navigation {{{1

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

" 'gV' to select last changed block
nnoremap gV `[v`]

" cycle through buffers
nnoremap <silent><leader>j :bprev<CR>
nnoremap <silent><leader>k :bnext<CR>

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
" }}}1

