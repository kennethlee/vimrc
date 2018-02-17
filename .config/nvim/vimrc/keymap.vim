" misc. {{{1

nnoremap <Space> <Nop>

set mousehide mouse=nicr

" redo
nnoremap U <C-r>

" 'jk' exits Insert Mode
inoremap jk <Esc>
tnoremap jk <C-\><C-n>

" 'Y' yanks to EoL (consistent with D, C, etc)
nnoremap Y y$

" toggle folds with 'zz'
nnoremap zz za
xnoremap zz zf

" keep cursor in place after joining lines
nnoremap J mzJ`z

" forbid deletion via x from updating registers
noremap x "_x

" 'F8' to insert ISO 8601 timestamp + day of the week (Insert Mode)
inoremap <silent><F8> <C-r>=strftime("%FT%T%z, %a")<CR>

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
" indent object {{{1

onoremap <silent>ai :call fxn#IndTxtObj(0)<CR>
onoremap <silent>ii :call fxn#IndTxtObj(1)<CR>
vnoremap <silent>ai :call fxn#IndTxtObj(0)<CR><Esc>gv
vnoremap <silent>ii :call fxn#IndTxtObj(1)<CR><Esc>gv

" ==============================================================================
" <Space> {{{1
" <Space>f: file ops {{{2

" rename current file
nnoremap <silent><Space>fr :call fxn#RenameFile()<CR>

" ==============================================================================
" <Space>t: find {{{2

nnoremap <silent><Space>tr :Files<CR>
nnoremap <Space>te :Files ~/
nnoremap <silent><Space>tn :Files ~/Documents/notes<CR>
nnoremap <silent><Space>tj :Files ~/Dropbox/notes<CR>

" ==============================================================================
" <Space>v: general vim {{{2

" open .vimrc
nnoremap <silent><Space>vv :edit ~/.config/nvim/vimrc<CR>

" ==============================================================================
" navigation {{{1
" nav: buffer {{{2

" close buffer without losing the split
nnoremap <silent><Space>bd :bprevious<CR>:bdelete #<CR>

" switch to the alternate buffer
nnoremap <BS> <C-^>

" list all open buffers then wait for tab completion or input + tab completion
nnoremap <Space>bb :ls<CR>:b *
nnoremap <Space>bs :ls<CR>:sbuffer *
nnoremap <Space>bv :ls<CR>:vert sbuffer *

" cycle through items in the quickfix list
nnoremap <silent><C-k> :cprevious<CR>
nnoremap <silent><C-j> :cnext<CR>

" cycle through items in the location list
nnoremap <silent><M-k> :lprevious<CR>
nnoremap <silent><M-j> :lnext<CR>

" cycle through buffers
nnoremap <silent><C-h> :bprevious<CR>
nnoremap <silent><C-l> :bnext<CR>

" ==============================================================================
" nav: windows {{{2

" toggle quickfix list / location list windows
" nnoremap <silent><Space>q :call fxn#QuickfixToggle()<CR>
" nnoremap <silent><Space>l :call fxn#LocationListToggle()<CR>
nmap <Space>q <Plug>qf_qf_toggle
nmap <Space>l <Plug>qf_loc_toggle

" toggle term window
nnoremap <silent><Space>w :call fxn#NvimTerminalToggle()<CR>
tnoremap <silent><Space>w <C-\><C-n>:call fxn#NvimTerminalToggle()<CR>

" ==============================================================================
" }}}1

