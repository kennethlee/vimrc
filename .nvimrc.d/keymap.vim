" general {{{1
" misc. {{{2

" Y yanks to EOL (consistent with D, C, etc).
nnoremap Y y$

" y yanks to system clipboard in Visual Mode.
xnoremap y "*y

" toggle folds with Space
nnoremap <space> za
xnoremap <space> zf

" steve losh' quickfix window
nnoremap <silent><c-q> :call <sid>QuickfixToggle()<cr>

" keep cursor in place after joining lines
nnoremap J mzJ`z

" F8 to insert ISO 8601 timestamp + day of the week (Insert mode).
inoremap <silent><f8> <c-r>=strftime("%FT%T%z, %a")<cr>

" hitting CR or ESC clears highlighting from previous search
nnoremap <silent><cr> :nohlsearch<cr>/<bs>
nnoremap <silent><esc> :nohlsearch<cr>/<bs>

" C-n/C-p to cycle through buffers (keep below Tabbing section above?)
nnoremap <silent><c-n> :bnext<cr>
nnoremap <silent><c-p> :bprev<cr>

" search using normal regex; "very magic"
" Commented out so that incsearch will work properly.
" nnoremap / /\v
" xnoremap / /\v
" nnoremap ? ?\v
" xnoremap ? ?\v

" disable arrow keys.
map <left> <nop>
map <right> <nop>
map <up> <nop>
map <down> <nop>
imap <left> <nop>
imap <right> <nop>
imap <up> <nop>
imap <down> <nop>

" hide mouse, disable it from triggering Visual mode, page up/down.
set mousehide mouse=nicr
map <mouseup> <nop>
map <mousedown> <nop>
map! <mouseup> <nop>
map! <mousedown> <nop>

"===============================================================================
" hljk {{{2

" use j and k to move by display lines, not real lines (Normal/Visual mode)
nnoremap j gj
nnoremap k gk
xnoremap j gj
xnoremap k gk

" Alt + hjkl for window navigation
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

" terminal movement
if has('nvim')
  tnoremap ˙ <c-\><c-n><c-w>h
  tnoremap ∆ <c-\><c-n><c-w>j
  tnoremap ˚ <c-\><c-n><c-w>k
  tnoremap ¬ <c-\><c-n><c-w>l
endif

"===============================================================================
" tab {{{2

" gb's multi-purpose tabs
inoremap <silent><tab> <c-r>=InsertTabWrapper()<cr>
inoremap <silent><s-tab> <c-n>

"===============================================================================
" incsearch.vim {{{2

map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

"===============================================================================
" leader {{{1
" core {{{2

" leader = comma
let g:mapleader=","

" gb's Leader-Leader to quickly switch to alternate buffer
nnoremap <leader><leader> <c-^>

"===============================================================================
" (leader-c_) change {{{2

" use leader key before change/delete command to delete without yanking.
" ex: ,dd or 20,dd or ,C or ,cap
" also forbid deletion via x from updating registers.
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
" (leader-f_) dirvish + file operations {{{2

nnoremap <silent>- :Dirvish %:p:h<cr>
nnoremap <leader>ff :Dirvish ~/

" `:!mkdir %/foo` to create a directory.

" leader-fr = GB's rename current file
noremap <silent><leader>fm :call RenameFile()<cr>

" delete a file
nnoremap <leader>fr :call delete(getline('.'))<cr>

" delete a range of files
nnoremap <leader>fd :'<,'>call delete(getline('.'))

" (leader-v_) vim (general) {{{2

" leader-vm = maximize width of current window
nnoremap <silent><leader>vm <c-w>\|

" leader-vs = toggle spell check
nnoremap <silent><leader>vs :call SpellToggle()<cr>

" leader-vv = open .vimrc
nnoremap <silent><leader>vv :e $MYVIMRC<cr>

" leader-vo = open nvim config dir
nnoremap <silent><leader>vo :e ~/.nvimrc.d/<cr>

" leader-vw = toggle wrap and list characters
nnoremap <silent><leader>vw :set list!<cr>

"===============================================================================
" (leader-t_) fzf {{{2

nnoremap <silent><leader>tt :FZF<cr>
nnoremap <leader>te :FZF ~/
nnoremap <silent><leader>tl :FZFLines<cr>
nnoremap <silent><leader>tm :FZFMru<cr>
nnoremap <silent><leader>tn :FZF ~/Documents/notes<cr>
nnoremap <silent><leader>tp :FZF ~/projects<cr>

" select buffer
function! s:buflist()
  redir => ls
  silent ls
  redir END
  return split(ls, '\n')
endfunction

function! s:bufopen(e)
  execute 'buffer' matchstr(a:e, '^[ 0-9]*')
endfunction

nnoremap <silent><leader>tu :call fzf#run({
\   'source':  reverse(<sid>buflist()),
\   'sink':    function('<sid>bufopen'),
\   'options': '+m',
\   'down':    len(<sid>buflist()) + 2
\ })<cr>

"===============================================================================
" (leader-r_) registers {{{2

" view registers
nnoremap <silent><leader>r :registers<cr>

"===============================================================================
" (leader-g_) fugitive {{{2

nnoremap <leader>ga :Git add %:p:h<cr>
nnoremap <leader>gb :Git branch 
nnoremap <leader>go :Git checkout 
nnoremap <leader>gc :Git commit -m "
nnoremap <leader>gd :Git diff<cr>
nnoremap <leader>gh :Git hist<cr>
nnoremap <leader>gr :Git reset HEAD %<cr>
nnoremap <leader>gs :Git status<cr>
nnoremap <leader>gt :Git tag 

"===============================================================================
" (leader-a_) EasyAlign {{{2

" start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <enter> <Plug>(EasyAlign)

" start interactive EasyAlign for a motion/text object (e.g. <Leader>aip)
nmap <leader>ab <Plug>(EasyAlign)

"===============================================================================
" }}}1
