" disable {{{1

nnoremap <Space> <Nop>

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

" redo
nnoremap U <C-r>

" 'jk' exits Insert Mode
inoremap jk <Esc>
tnoremap jk <C-\><C-n>

" map '6' to '^' to avoid having to press shift
nnoremap 6 ^

" 'Y' yanks to EoL (consistent with D, C, etc)
nnoremap Y y$

" toggle folds with 'zz'
nnoremap zz za
xnoremap zz zf

" keep cursor in place after joining lines
nnoremap J mzJ`z

" 'gV' to select last changed block
nnoremap gV `[v`]

" forbid deletion via x from updating registers
noremap x "_x

" 'F8' to insert ISO 8601 timestamp + day of the week (Insert Mode)
inoremap <silent><F8> <C-r>=strftime("%FT%T%z, %a")<CR>

" so natural
nnoremap <CR> :

" clear highlighting from previous search
nnoremap <silent><Esc> :nohlsearch<CR><Esc>

" ==============================================================================
" html tag completion {{{1

" inline tag
inoremap <C-l> ><Esc>F<lyiwf>a</<Esc>pa><Esc>F<i

" block tag
inoremap <C-j> ><Esc>F<lyiwo</<C-r>"><Esc>O

" ==============================================================================
" smarter tab {{{1

inoremap <silent><expr> <Tab> fxn#InsertTabWrapper()
inoremap <silent><S-Tab> <C-n>

" ==============================================================================
" turbo-charged dot {{{1

" 'cN/cn' on current word, change, dot repeat, be amazed
nnoremap cN #``cgN
nnoremap cn *``cgn

" 'cN/cn' on visually-selected text, change, dot repeat
" hit 'N/n' to jump to previous/next occurrence per the usual
let g:mc = "y/\\V\<C-r>=escape(@\", '/')\<CR>\<CR>"
vnoremap <expr> cN g:mc . "``cgN"
vnoremap <expr> cn g:mc . "``cgn"

" ==============================================================================
" <Space> {{{1
" <Space>f: file ops {{{2

" run make
nnoremap <Space>fm :make! %<CR>
nnoremap <Space>fM :make! .<CR>

" strip whitespace
nnoremap <silent><Space>ft :%s/\s\+$//<CR>:let @/=''<CR>

" rename current file
nnoremap <silent><Space>fr :call fxn#RenameFile()<CR>

" ==============================================================================
" <Space>t: find {{{2

nnoremap <silent><Space>tr :Files<CR>
nnoremap <Space>te :Files ~/
nnoremap <silent><Space>tl :BLines<CR>
nnoremap <silent><Space>tk :Lines<CR>
nnoremap <silent><Space>tn :Files ~/Documents/notes<CR>
nnoremap <silent><Space>tj :Files ~/Dropbox/notes<CR>

" ==============================================================================
" <Space>v: general vim {{{2

" maximize width of current window
nnoremap <Space>vm <C-w>\|

" open .vimrc
nnoremap <silent><Space>vv :edit ~/.config/nvim/vimrc<CR>

" ==============================================================================
" navigation {{{1
" nav: splits {{{2

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

" close buffer without losing the split
nnoremap <silent><Space>bd :bprevious<CR>:bdelete #<CR>

" <Space><Space> to switch to the alternate buffer
nnoremap <Space><Space> <C-^>

" list all open buffers then wait for tab completion or input + tab completion
nnoremap <Space>bb :ls<CR>:b *
nnoremap <Space>bs :ls<CR>:sbuffer *
nnoremap <Space>bv :ls<CR>:vert sbuffer *

" cycle through buffers
nnoremap <silent><M-h> :bprevious<CR>
nnoremap <silent><M-l> :bnext<CR>

" ==============================================================================
" nav: windows {{{2

" toggle quickfix window
nnoremap <silent><Space>q :call fxn#QuickfixToggle()<CR>

" cycle through items in the quickfix list
nnoremap <silent><M-k> :cprevious<CR>
nnoremap <silent><M-j> :cnext<CR>

" close an open preview window
nnoremap <silent><Space>w :pclose<CR>

" ==============================================================================
" }}}1

