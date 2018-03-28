" general {{{1

set mousehide mouse=nicr

nnoremap J  mzJ`z
nnoremap U  <C-r>
noremap  x  "_x
nnoremap Y  y$

" indent text object
onoremap <silent>ai :call textobject#IndentedBlock(0)<CR>
onoremap <silent>ii :call textobject#IndentedBlock(1)<CR>
vnoremap <silent>ai :call textobject#IndentedBlock(0)<CR><Esc>gv
vnoremap <silent>ii :call textobject#IndentedBlock(1)<CR><Esc>gv

" change contents of a macro, ex: chq to edit register q
nnoremap ch :call macro#ChangeRegister()<CR>

" turbo-charged dot: 'cN/cn' on current word, change, dot repeat, be amazed
" on visually-selected text; N/n for prev/next occurrence per the usual.
nnoremap        cN #``cgN
nnoremap        cn *``cgn
let g:mc = "y/\\V\<C-r>=escape(@\", '/')\<CR>\<CR>"
vnoremap <expr> cN g:mc . "``cgN"
vnoremap <expr> cn g:mc . "``cgn"

" html tag completion
inoremap <C-l> ><Esc>F<lyiwf>a</<Esc>pa><Esc>F<i
inoremap <C-j> ><Esc>F<lyiwo</<C-r>"><Esc>O

" clear highlighting from previous search
nnoremap <silent><Esc> :nohlsearch<CR><Esc>

" 'F8' to insert ISO 8601 timestamp + day of the week
inoremap <silent><F8> <C-r>=strftime("%FT%T%z, %a")<CR>

" tab
inoremap <silent><expr><Tab> key#InsertTabWrapper()
inoremap <silent>      <S-Tab> <C-n>

" ==============================================================================
" <Space> {{{1

nnoremap         <Space>   <Nop>

nnoremap         <Space>bb :ls<CR>:buffer<Space>*
nnoremap         <Space>bs :ls<CR>:sbuffer<Space>*
nnoremap         <Space>bv :ls<CR>:vertical<Space>sbuffer<Space>*
nnoremap <silent><Space>bd :call setloclist(winnr(), [])<CR>:lclose<Bar>bprevious<Bar>bdelete<Space>#<CR>

nnoremap         <Space>fc :call file#RemoveFancyCharacters()<CR>
nnoremap <silent><Space>fr :call file#RenameFile()<CR>
nnoremap <silent><Space>ft :%s/\s\+$//e<CR>:let @/=''<CR>
nnoremap <silent><Space>vv :edit ~/.config/nvim/vimrc<CR>

nnoremap <silent><Space>tr :FZF<CR>
nnoremap         <Space>te :FZF ~/
nnoremap <silent><Space>tn :FZF ~/Documents/notes<CR>
nnoremap <silent><Space>tj :FZF ~/Dropbox/notes<CR>

nnoremap <silent><Space>q  :<C-u>call qf#QuickfixToggle()<CR>
nnoremap <silent><Space>l  :<C-u>call qf#LocListToggle()<CR>
nnoremap <silent><Space>w  :call window#TerminalToggle()<CR>
tnoremap <silent><Space>w  <C-\><C-n>:call window#TerminalToggle()<CR>

" ==============================================================================
" navigation {{{1

nnoremap <BS> <C-^>

nnoremap <silent><C-h> :call setloclist(winnr(), [])<CR>:lclose<Bar>bprevious<CR>
nnoremap <silent><C-l> :call setloclist(winnr(), [])<CR>:lclose<Bar>bnext<CR>

nnoremap <silent><C-k> :cprevious<CR>
nnoremap <silent><C-j> :cnext<CR>

nnoremap <silent><M-k> :lprevious<CR>
nnoremap <silent><M-j> :lnext<CR>

" ==============================================================================
" }}}1

