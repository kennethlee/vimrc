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
" auto-closing brackets {{{1

inoremap (<CR> (<CR>)<Esc>O
inoremap {<CR> {<CR>}<Esc>O
inoremap {; {<CR>};<Esc>O
inoremap {, {<CR>},<Esc>O
inoremap [<CR> [<CR>]<Esc>O
inoremap [; [<CR>];<Esc>O
inoremap [, [<CR>],<Esc>O

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
" <Space>c: change {{{2

" use space key before change/delete command to delete without yanking
" also forbid deletion via x from updating registers
nnoremap <Space>C "_C
xnoremap <Space>C "_C
nnoremap <Space>c "_c
xnoremap <Space>c "_c
nnoremap <Space>D "_D
xnoremap <Space>D "_D
nnoremap <Space>d "_d
xnoremap <Space>d "_d
noremap x "_x

" ==============================================================================
" <Space>f: file ops {{{2

" run make
nnoremap <Space>fm :make! %<CR>
nnoremap <Space>fM :make! .<CR>

" strip whitespace
nnoremap <silent><Space>ft :%s/\s\+$//<CR>:let @/=''<CR>

" rename current file
nnoremap <silent><Space>fr :call autofxn#RenameFile()<CR>

" ==============================================================================
" <Space>t: find / grep {{{2

nnoremap <Space>tr :find *
nnoremap <Space>te :find ~/*
nnoremap <Space>tk :grep!<Space>
nnoremap <Space>tn :find ~/Documents/notes/*
nnoremap <Space>tj :find ~/Dropbox/notes/*
nnoremap <Space>ta :find ~/Dropbox/apps/todo/*

" find files recursively under the directory of the current file
nnoremap <Space>F :find <C-R>=fnameescape(expand('%:p:h')).'/**/*'<CR>
nnoremap <Space>S :sfind <C-R>=fnameescape(expand('%:p:h')).'/**/*'<CR>
nnoremap <Space>V :vert sfind <C-R>=fnameescape(expand('%:p:h')).'/**/*'<CR>

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

" <Space><Space> to switch to the alternate buffer
nnoremap <Space><Space> <C-^>

" list all open buffers then wait for tab completion or input + tab completion
nnoremap <Space>bb :ls<CR>:b *
nnoremap <Space>bs :ls<CR>:sbuffer *

" cycle through buffers
nnoremap <silent><M-h> :bprevious<CR>
nnoremap <silent><M-l> :bnext<CR>

" ==============================================================================
" nav: windows {{{2

" toggle quickfix window
nnoremap <silent><Space>q :call autofxn#QuickfixToggle()<CR>

" cycle through items in the quickfix list
nnoremap <silent><M-k> :cprevious<CR>
nnoremap <silent><M-j> :cnext<CR>

" close an open preview window
nnoremap <silent><Space>w :pclose<CR>

" ==============================================================================
" nav: misc. {{{2

" dirvish
nnoremap <silent>- :Dirvish %:p:h<CR>
nnoremap <Space>fd :Dirvish ~/

" jump to/from lines with same indentation level
nnoremap <silent>_ :call fxn#NextIndent(0, 0, 0, 1)<CR>
nnoremap <silent>+ :call fxn#NextIndent(0, 1, 0, 1)<CR>
vnoremap <silent>_ <Esc>:call fxn#NextIndent(0, 0, 0, 1)<CR>m'gv''
vnoremap <silent>+ <Esc>:call fxn#NextIndent(0, 1, 0, 1)<CR>m'gv''
onoremap <silent>_ :call fxn#NextIndent(0, 0, 0, 1)<CR>
onoremap <silent>+ :call fxn#NextIndent(0, 1, 0, 1)<CR>

" ==============================================================================
" }}}1

