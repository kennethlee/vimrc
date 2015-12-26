" general {{{1
" first {{{2

" infect!
execute pathogen#infect()
call pathogen#helptags()

" fzf
set rtp+=~/.fzf

" file handling {{{2

set nomodeline
syntax on

" encoding
set encoding=utf-8
scriptencoding utf-8
set fileencodings=utf-8

" enable filetype detection
filetype plugin indent on

" hide buffers w/o having to save first.
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

" backspacing wraps.
set backspace=indent,eol,start

" default tab settings
" set cindent
set softtabstop=2
set shiftwidth=2
set autoindent
set expandtab

" gb: insert only one space when joining lines that contain sentence-terminating
" punctuation like `.`.
set nojoinspaces

" tab completion
set wildmenu wildmode=longest,list,full

" gb: normally, Vim messes with iskeyword when you open a shell file. This can
" leak out, polluting other file types even after a 'set ft=' change. This
" variable prevents the iskeyword change so it can't hurt anyone.
let g:sh_noisk=1

"===============================================================================
" search {{{2

set incsearch
set ignorecase
set smartcase
set hlsearch
set title t_ti= t_te=

"===============================================================================
" plugin config {{{1
" fzf {{{2
" buffer: search lines in all open {{{3

function! s:line_handler(l)
  let keys = split(a:l, ':\t')
  exec 'buf ' . keys[0]
  exec keys[1]
  normal! ^zz
endfunction

function! s:buffer_lines()
  let res = []
  for b in filter(range(1, bufnr('$')), 'buflisted(v:val)')
    call extend(res, map(getbufline(b,0,"$"), 'b . ":\t" . (v:key + 1) . ":\t" . v:val '))
  endfor
  return res
endfunction

command! FZFLines call fzf#run({
\   'source':  <sid>buffer_lines(),
\   'sink':    function('<sid>line_handler'),
\   'options': '--extended --nth=3..',
\   'down':    '60%'
\})

"===============================================================================
" commandline: fuzzy completion {{{3

cnoremap <silent> <c-l> <c-\>eGetCompletions()<cr>
"add an extra <cr> at the end of this line to automatically accept the fzf-selected completions.

function! Lister()
    call extend(g:FZF_Cmd_Completion_Pre_List,split(getcmdline(),'\(\\\zs\)\@<!\& '))
endfunction

function! CmdLineDirComplete(prefix, options, rawdir)
    let l:dirprefix = matchstr(a:rawdir,"^.*/")
    if isdirectory(expand(l:dirprefix))
        return join(a:prefix + map(fzf#run({
                    \'options': a:options . ' --select-1  --query=' .
                    \ a:rawdir[matchend(a:rawdir,"^.*/"):len(a:rawdir)], 
                    \'dir': expand(l:dirprefix)
                    \}), 
                    \'"' . escape(l:dirprefix, " ") . '" . escape(v:val, " ")'))
    else
        return join(a:prefix + map(fzf#run({
                    \'options': a:options . ' --query='. a:rawdir }),
                    \'escape(v:val, " ")')) 
        "dropped --select-1 to speed things up on a long query
endfunction

function! GetCompletions()
    let g:FZF_Cmd_Completion_Pre_List = []
    let l:cmdline_list = split(getcmdline(), '\(\\\zs\)\@<!\& ', 1)
    let l:Prefix = l:cmdline_list[0:-2]
    execute "silent normal! :" . getcmdline() . "\<c-a>\<c-\>eLister()\<cr>\<c-c>"
    let l:FZF_Cmd_Completion_List = g:FZF_Cmd_Completion_Pre_List[len(l:Prefix):-1]
    unlet g:FZF_Cmd_Completion_Pre_List
    if len(l:Prefix) > 0 && l:Prefix[0] =~
                \ '^ed\=i\=t\=$\|^spl\=i\=t\=$\|^tabed\=i\=t\=$\|^arged\=i\=t\=$\|^vsp\=l\=i\=t\=$'
                "single-argument file commands
        return CmdLineDirComplete(l:Prefix, "",l:cmdline_list[-1])
    elseif len(l:Prefix) > 0 && l:Prefix[0] =~ 
                \ '^arg\=s\=$\|^ne\=x\=t\=$\|^sne\=x\=t\=$\|^argad\=d\=$'  
                "multi-argument file commands
        return CmdLineDirComplete(l:Prefix, '--multi', l:cmdline_list[-1])
    else 
        return join(l:Prefix + fzf#run({
                    \'source':l:FZF_Cmd_Completion_List, 
                    \'options': '--select-1 --query='.shellescape(l:cmdline_list[-1])
                    \})) 
    endif
endfunction

"===============================================================================
" file: mru {{{3

command! FZFMru call fzf#run({
            \'source': v:oldfiles,
            \'sink' : 'e ',
            \'options' : '-m',
            \})

"===============================================================================
" neomake {{{2

autocmd! BufWritePost * Neomake

"===============================================================================
" undotree {{{2

" if set, let undotree window get focus after being opened, otherwise
" focus will stay in current window.
if !exists('g:undotree_SetFocusWhenToggle')
  let g:undotree_SetFocusWhenToggle = 1
endif

" Highlight changed text
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

" better looking folds; right-alignment of line numbers + percentage of file.
" taken from https://github.com/NagatoPain/dotfiles/blob/master/.vim/vimrc
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

" fold options. See ':help fold-options' for more.
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

" indent if at the beginning of a line, else, do completion.
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
" necessary for proper color but still overridden by terminal; is this normal?
set background=dark
let base16colorspace=256
colorscheme base16-eighties

" display symbols for tabs, end-of-line, trailing whitespace
set list
set listchars=tab:▸\ ,eol:¬,trail:@

" absolute line numbers and width to 6 chars.
set number
set numberwidth=6

" window behavior
set winminwidth=15 winwidth=90
set noequalalways winminheight=0 winheight=9999 helpheight=9999
set splitright splitbelow

"===============================================================================
" status line {{{2

" current line in netrw now yellow highlight/black text
" hi CursorLine cterm=NONE ctermbg=yellow ctermfg=black

set laststatus=2

hi default link User1 Identifier                " filename
hi default link User2 Statement                 " flags
hi default link User3 Error                     " errors

set stl=
set stl+=%2*[%n                                 " buffer number
set stl+=%{'/'.len(filter(range(1,bufnr('$')),
    \'buflisted(v:val)'))}                      " total number of open buffers
set stl+=%H%M%R%W]%*\                           " flags
set stl+=%{exists('g:loaded_fugitive')?fugitive#statusline():''}%<
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
" jk exits Insert Mode
inoremap jk <esc>

" Y yanks to EOL (consistent with D, C, etc).
nnoremap Y y$

" y yanks to system clipboard in Visual Mode.
xnoremap y "*y

" keep cursor in place after joining lines
nnoremap J mzJ`z

" F8 to insert ISO 8601 timestamp + day of the week (Insert mode).
inoremap <silent><f8> <c-r>=strftime("%FT%T%z, %a")<cr>

" hitting CR or ESC clears highlighting from previous search
nnoremap <silent><cr> :nohlsearch<cr>/<bs>
nnoremap <silent><esc> :nohlsearch<cr>/<bs>

" tab/shift-tab to cycle through buffers
nnoremap <silent><tab> :bnext<cr>
nnoremap <silent><s-tab> :bprev<cr>

" search using normal regex; "very magic"
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

tnoremap ˙ <c-\><c-n><c-w>h
tnoremap ∆ <c-\><c-n><c-w>j
tnoremap ˚ <c-\><c-n><c-w>k
tnoremap ¬ <c-\><c-n><c-w>l

"===============================================================================
" tab {{{2

" gb's multi-purpose tabs
inoremap <silent><tab> <c-r>=InsertTabWrapper()<cr>
inoremap <silent><s-tab> <c-n>

"===============================================================================
" disable {{{2
"
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
" leader core {{{2

let g:mapleader="\<space>"

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
" (leader-g_) fugitive {{{2

nnoremap <leader>ga :Git add %:p<cr>
nnoremap <leader>gc :Git checkout %<cr>
nnoremap <leader>gm :Gcommit<cr>

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

" leader-vb = open .bashrc
nnoremap <silent><leader>vb :e ~/.bashrc<cr>

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
" (leader-n_) undotree {{{2

nnoremap <silent><leader>n :UndotreeToggle<cr>

"===============================================================================
" (leader-r_) registers {{{2

" view registers
nnoremap <silent><leader>r :registers<cr>

"===============================================================================
" (leader-a_) easyalign {{{2

" start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <enter> <Plug>(EasyAlign)

" start interactive EasyAlign for a motion/text object (e.g. <Leader>aip)
nmap <leader>ab <Plug>(EasyAlign)

"===============================================================================
" }}}1

