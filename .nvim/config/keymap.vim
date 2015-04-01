" General {{{1
" Misc. {{{2

" Y yanks to EOL (consistent with D, C, etc).
nnoremap Y y$

" y yanks to system clipboard in Visual Mode.
xnoremap y "*y

" Toggle folds with Space
nnoremap <space> za
xnoremap <space> zf

" Steve Losh' Quickfix Window
nnoremap <silent><c-q> :call <sid>QuickfixToggle()<cr>

" Keep cursor in place after joining lines
nnoremap J mzJ`z

" F8 to insert ISO 8601 timestamp + day of the week (Insert mode).
inoremap <silent><f8> <c-r>=strftime("%FT%T%z, %a")<cr>

" Hitting CR or ESC clears highlighting from previous search
nnoremap <silent><cr> :nohlsearch<cr>/<bs>
nnoremap <silent><esc> :nohlsearch<cr>/<bs>

" C-n/C-p to cycle through buffers (keep below Tabbing section above?)
nnoremap <silent><c-n> :bnext<cr>
nnoremap <silent><c-p> :bprev<cr>

" Search using normal regex; "very magic"
" Commented out so that incsearch will work properly.
" nnoremap / /\v
" xnoremap / /\v
" nnoremap ? ?\v
" xnoremap ? ?\v

" Disable arrow keys.
map <left> <nop>
map <right> <nop>
map <up> <nop>
map <down> <nop>
imap <left> <nop>
imap <right> <nop>
imap <up> <nop>
imap <down> <nop>

" Hide mouse, disable it from triggering Visual mode, page up/down.
set mousehide mouse=nicr
map <mouseup> <nop>
map <mousedown> <nop>
map! <mouseup> <nop>
map! <mousedown> <nop>

" }}}
" HLJK {{{2

" Use j and k to move by display lines, not real lines (Normal/Visual mode)
nnoremap j gj
nnoremap k gk
xnoremap j gj
xnoremap k gk

" Alt + hjkl for window navigation
noremap ˙ <c-w>h
noremap ∆ <c-w>j
noremap ˚ <c-w>k
noremap ¬ <c-w>l

" Terminal movement {{{2

nnoremap ˙ <c-w>h
nnoremap ∆ <c-w>j
nnoremap ˚ <c-w>k
nnoremap ¬ <c-w>l

vnoremap ˙ <c-n><c-w>h
vnoremap ∆ <c-n><c-w>j
vnoremap ˚ <c-n><c-w>k
vnoremap ¬ <c-n><c-w>l

inoremap ˙ <c-\><c-n><c-w>h
inoremap ∆ <c-\><c-n><c-w>j
inoremap ˚ <c-\><c-n><c-w>k
inoremap ¬ <c-\><c-n><c-w>l

cnoremap ˙ <c-\><c-n><c-w>h
cnoremap ∆ <c-\><c-n><c-w>j
cnoremap ˚ <c-\><c-n><c-w>k
cnoremap ¬ <c-\><c-n><c-w>l

if has('nvim')
  tnoremap ˙ <c-\><c-n><c-w>h
  tnoremap ∆ <c-\><c-n><c-w>j
  tnoremap ˚ <c-\><c-n><c-w>k
  tnoremap ¬ <c-\><c-n><c-w>l
endif

" Tab {{{2

" GB's multi-purpose tabs
inoremap <silent><tab> <c-r>=InsertTabWrapper()<cr>
inoremap <silent><s-tab> <c-n>

" incsearch.vim {{{2

map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

" Leader {{{1
" Core {{{2

" Leader = comma
let g:mapleader=","

" GB's Leader-Leader to quickly switch to alternate buffer
nnoremap <leader><leader> <c-^>

" (Leader-c_) Change {{{2

" Use Leader key before change/delete command to delete without yanking.
" Ex: ,dd or 20,dd or ,C or ,cap
" Also forbid deletion via x from updating registers.
nnoremap <leader>C "_C
xnoremap <leader>C "_C
nnoremap <leader>c "_c
xnoremap <leader>c "_c
nnoremap <leader>D "_D
xnoremap <leader>D "_D
nnoremap <leader>d "_d
xnoremap <leader>d "_d
noremap x "_x

" (Leader-f_) dirvish + file operations {{{2

nnoremap <silent>- :Dirvish :p:h<cr>
nnoremap <leader>ff :Dirvish ~/

" `:!mkdir %/foo` to create a directory.

" Leader-fr = GB's rename current file
noremap <silent><leader>fm :call RenameFile()<cr>

" Delete a file
nnoremap <leader>fr :call delete(getline('.'))<cr>

" Delete a range of files
nnoremap <leader>fd :'<,'>call delete(getline('.'))

" (Leader-v_) Vim (General) {{{2

" Leader-vm = maximize width of current window
nnoremap <silent><leader>vm <c-w>\|

" Leader-vs = toggle spell check
nnoremap <silent><leader>vs :call SpellToggle()<cr>

" Leader-vv = open .vimrc
nnoremap <silent><leader>vv :e $MYVIMRC<cr>

" Leader-vo = open nvim config dir
nnoremap <silent><leader>vo :e ~/.nvim/config/<cr>

" Leader-vw = toggle wrap and list characters
nnoremap <silent><leader>vw :set list!<cr>

" (Leader-t_) CtrlP {{{2

" Leader-tt = CtrlP
let g:ctrlp_map = '<leader>tt'
let g:ctrlp_cmd = 'CtrlP'

nnoremap <leader>te :CtrlP ~/
nnoremap <silent><leader>tl :CtrlPLine<cr>
nnoremap <silent><leader>tm :CtrlPMRU<cr>
nnoremap <silent><leader>tn :CtrlP ~/Documents/Notes<cr>
nnoremap <silent><leader>tp :CtrlP ~/Projects<cr>
nnoremap <silent><leader>tu :CtrlPBuffer<cr>
nnoremap <silent><leader>tw :CtrlPMixed<cr>

" (Leader-t_) fzf {{{2

" nnoremap <silent><leader>tt :FZF<cr>

" (Leader-r_) Registers {{{2

" View registers
nnoremap <silent><leader>r :registers<cr>

" (Leader-g_) Fugitive {{{2

nnoremap <leader>ga :Git add %<cr>
nnoremap <leader>gb :Git branch 
nnoremap <leader>go :Git checkout 
nnoremap <leader>gc :Git commit -m "
nnoremap <leader>gd :Git diff<cr>
nnoremap <leader>gh :Git hist<cr>
nnoremap <leader>gr :Git reset HEAD %<cr>
nnoremap <leader>gs :Git status<cr>
nnoremap <leader>gt :Git tag 

" (Leader-a_) EasyAlign {{{2

" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <enter> <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. <Leader>aip)
nmap <leader>ab <Plug>(EasyAlign)

" vim-rooter {{{2

let g:rooter_disable_map = 1

" }}}1
