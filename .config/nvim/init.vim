" options {{{1

" encoding must be set before scriptencoding
set encoding=utf-8
scriptencoding utf-8
set nomodeline
set clipboard+=unnamedplus
filetype indent off
filetype plugin on
syntax on
set runtimepath+=~/.fzf

" gb: normally, Vim messes with iskeyword when you open a shell file. This can
" leak out, polluting other file types even after a 'set ft=' change. This
" variable prevents the iskeyword change so it can't hurt anyone
let g:sh_noisk = 1

if executable('rg')
  set grepprg=rg\ --vimgrep\ --no-heading
  set grepformat=%f:%l:%c:%m,%f:%l:%m
endif

" enable
" note for nvim: matchit is on by default
runtime macros/matchit.vim
packadd cfilter

" disable
let g:loaded_netrwPlugin = 1

set autoindent
set autoread
set backspace=indent,eol,start
set breakindent
set cmdheight=2
set cmdwinheight=20
set cursorcolumn
set expandtab
set foldmethod=manual
set foldnestmax=5
set foldopen-=block
set foldtext=fold#HeaderText()
set hidden
set hlsearch
set ignorecase
set inccommand=nosplit
set incsearch
set keywordprg=:DD
set linebreak
set list
set listchars=tab:▸\ ,eol:¬,trail:@
set nobackup
set noequalalways
set nofoldenable
set nojoinspaces
set noswapfile
set number
set shiftwidth=2
set showmode
set smartcase
set softtabstop=2
set splitbelow
set splitright
set switchbuf=useopen
set synmaxcol=150
set tabstop=2
set termguicolors
set title t_ti= t_te=
set wildignorecase
set wildmenu
set wildmode=list:longest,full
set winwidth=90 winminwidth=40
set wrap

" ==============================================================================
" commands {{{1

command! Bdelete                lexpr [] | lclose | bprevious | bdelete #
command! Bnext                  lexpr [] | lclose | bnext
command! Bprevious              lexpr [] | lclose | bprevious
command! ChangeRegister         call macro#ChangeRegister()
command! RemoveFancyCharacters  call file#RemoveFancyCharacters()
command! RenameFile             call file#RenameFile()
command! ToggleLocationList     call window#ToggleLocationList()
command! ToggleQuickfixList     call window#ToggleQuickfixList()
command! ToggleTerminal         call window#ToggleTerminal()
command! WipeMarks              delmarks! | delmarks A-Z0-9
command! WipeRegisters
  \   for s:i in range(34,122)
  \|    silent! call setreg(nr2char(s:i), [])
  \|  endfor

" ==============================================================================
" augroups {{{1

augroup user_fold
  autocmd!
augroup END

augroup user_highlight
  autocmd!
augroup END

augroup user_lint
  autocmd!
augroup END

augroup user_quickfix
  autocmd!
  " automatically open loclist / quickfix window if there are valid errors
  " after executing quickfix commands
  autocmd user_quickfix QuickFixCmdPost [^l]* botright cwindow
  autocmd user_quickfix QuickFixCmdPost l* lwindow
augroup END

augroup user_startup
  autocmd!
  autocmd user_startup VimEnter * WipeMarks
  autocmd user_startup VimEnter * WipeRegisters
augroup END

augroup user_statusline
  autocmd!
  " for `fxn#StatuslineWarningWhitespace()`
  autocmd user_statusline BufWritePost,CursorHold *
    \   unlet! b:statusline_warning_whitespace
augroup END

augroup user_terminal
  autocmd!
  autocmd user_terminal TermOpen *
    \   setlocal nonumber
    \|  setlocal norelativenumber

  autocmd user_terminal TermOpen *
    \   nnoremap <buffer> <C-h> <Nop>
    \|  nnoremap <buffer> <C-l> <Nop>
augroup END

" ==============================================================================
" display {{{1

" properly highlight tabs / trailing whitespace
highlight link UnwantedWhitespace WarningMsg
" this must be kept here, **above** the setting of colorscheme
autocmd user_highlight BufEnter,WinEnter *
  \   call clearmatches()
  \|  call matchadd('UnwantedWhitespace', '\s\+$', 100)
  \|  call matchadd('UnwantedWhitespace', '\t', 100)

colorscheme base16-eighties

" statusline
" left
set statusline=
set statusline+=%#error#
set statusline+=%{statusline#BufModified()}
set statusline+=%*
set statusline+=%<                                  " truncation point
set statusline+=%#question#
set statusline+=%r                                  " read-only
set statusline+=%w                                  " preview buf
set statusline+=%*

" center
set statusline+=\ %-F\                              " absolute path

" right
set statusline+=%=
set statusline+=%y                                  " filetype
set statusline+=%#warningmsg#
set statusline+=%{statusline#WarningWhitespace()}
set statusline+=%{statusline#ExpandTab()}
set statusline+=%{statusline#FileEncoding()}
set statusline+=%{statusline#FileFormat()}
set statusline+=%*
set statusline+=%14.(%l,%c%V%)%4p                   " line,col percent

" ==============================================================================
" keymap: general {{{1

set mousehide mouse=nicr

nnoremap J  mzJ`z
inoremap jk <Esc>
nnoremap U  <C-r>
noremap  x  "_x
nnoremap Y  y$
nnoremap zz za

nnoremap <silent> _             :call textobject#NextIndent(0, 0, 0, 1)<CR>
onoremap <silent> _             :call textobject#NextIndent(0, 0, 0, 1)<CR>
vnoremap <silent> _             <Esc>:call textobject#NextIndent(0, 0, 0, 1)<CR>m'gv''
nnoremap <silent> +             :call textobject#NextIndent(0, 1, 0, 1)<CR>
onoremap <silent> +             :call textobject#NextIndent(0, 1, 0, 1)<CR>
vnoremap <silent> +             <Esc>:call textobject#NextIndent(0, 1, 0, 1)<CR>m'gv''

" change contents of a macro, ex: chq to edit register q
nnoremap          ch            :ChangeRegister<CR>

" turbo-charged dot: 'cN/cn' on current word, change, dot repeat, be amazed
" on visually-selected text; N/n for prev/next occurrence per the usual.
let g:mc = "y/\\V\<C-r>=escape(@\", '/')\<CR>\<CR>"
nnoremap          cN            #``cgN
nnoremap          cn            *``cgn
xnoremap <expr>   cN            g:mc . "``cgN"
xnoremap <expr>   cn            g:mc . "``cgn"

nnoremap          <BS>          <C-^>
nnoremap <silent> <C-h>         :Bprevious<CR>
nnoremap <silent> <C-l>         :Bnext<CR>
nnoremap <silent> <C-k>         :cprevious<CR>
nnoremap <silent> <C-j>         :cnext<CR>
nnoremap <silent> <M-k>         :lprevious<CR>
nnoremap <silent> <M-j>         :lnext<CR>
nnoremap <silent> <Esc>         :nohlsearch<CR><Esc>
inoremap <silent> <F8>          <C-r>=strftime("%FT%T%z, %a")<CR>
inoremap <silent> <expr><Tab>   key#InsertTabWrapper()
inoremap <silent> <S-Tab>       <C-n>

" ==============================================================================
" keymap: <Space> {{{1

nnoremap          <Space>       <Nop>

nnoremap          <Space>bb     :ls<CR>:buffer<Space>*
nnoremap          <Space>bs     :ls<CR>:sbuffer<Space>*
nnoremap          <Space>bv     :ls<CR>:vertical<Space>sbuffer<Space>*
nnoremap <silent> <Space>bd     :Bdelete<CR>

nnoremap          <Space>fc     :RemoveFancyCharacters<CR>
nnoremap <silent> <Space>fp     :%!prettier --stdin --stdin-filepath % --trailing-comma all<CR>
nnoremap <silent> <Space>fr     :RenameFile<CR>
nnoremap <silent> <Space>ft     :%s/\s\+$//e<CR>:let @/=''<CR>
nnoremap <silent> <Space>fw     :set wrap!<CR>
nnoremap <silent> <Space>vv     :edit $MYVIMRC<CR>

nnoremap <silent> <Space>tr     :FZF<CR>
nnoremap          <Space>te     :FZF ~/
nnoremap <silent> <Space>tj     :FZF ~/Dropbox/notes<CR>
nnoremap <silent> <Space>tl     :edit ~/.ledger/current.journal<CR>zm
nnoremap <silent> <Space>tn     :FZF ~/Documents/notes<CR>
nnoremap <silent> <Space>to     :FZF ~/Dropbox/Apps/todo<CR>

nnoremap <silent> <Space>q      :ToggleQuickfixList<CR>
nnoremap <silent> <Space>l      :ToggleLocationList<CR>
nnoremap <silent> <Space>w      :ToggleTerminal<CR>
tnoremap <silent> <Space>w      <C-\><C-n>:ToggleTerminal<CR>

" ==============================================================================
" }}}1

