" css {{{1

augroup filetype_css
  autocmd!
  " folding
  autocmd FileType css setlocal foldenable
  autocmd BufRead,BufNewFile *.css setlocal foldmethod=marker foldmarker={,}
  autocmd FileType css setlocal foldlevel=0
  autocmd FileType css setlocal foldnestmax=6
  autocmd FileType css setlocal foldcolumn=0
  " tabbing
  autocmd FileType css setlocal softtabstop=2
  autocmd FileType css setlocal shiftwidth=2
  autocmd FileType css setlocal autoindent
  autocmd FileType css setlocal expandtab
  " misc
  autocmd FileType css setlocal breakindent
augroup END

"===============================================================================
" elixir {{{1

augroup filetype_elixir
  autocmd!
  " folding
  autocmd FileType elixir setlocal foldenable
  autocmd FileType elixir setlocal foldmethod=syntax
  autocmd FileType elixir setlocal foldlevel=1
  autocmd FileType elixir setlocal foldnestmax=6
  autocmd FileType elixir setlocal foldcolumn=0
  " tabbing
  autocmd FileType elixir setlocal softtabstop=2
  autocmd FileType elixir setlocal shiftwidth=2
  autocmd FileType elixir setlocal autoindent
  autocmd FileType elixir setlocal expandtab
  " misc
  autocmd FileType elixir setlocal breakindent
  autocmd FileType elixir setlocal colorcolumn=81
augroup END

"===============================================================================
" eruby {{{1

augroup filetype_eruby
  autocmd!
  " folding
  autocmd FileType eruby setlocal foldenable
  autocmd FileType eruby setlocal foldmethod=indent
  autocmd FileType eruby setlocal foldlevel=0
  autocmd FileType eruby setlocal foldnestmax=6
  autocmd FileType eruby setlocal foldcolumn=0
  " tabbing
  autocmd FileType eruby setlocal softtabstop=2
  autocmd FileType eruby setlocal shiftwidth=2
  autocmd FileType eruby setlocal autoindent
  autocmd FileType eruby setlocal expandtab
  " misc
  autocmd FileType eruby setlocal breakindent
augroup END

"===============================================================================
" html {{{1

augroup filetype_html
  autocmd!
  " folding
  autocmd FileType html setlocal foldenable
  autocmd FileType html setlocal foldmethod=syntax
  autocmd FileType html setlocal foldlevel=1
  autocmd FileType html setlocal foldnestmax=6
  autocmd FileType html setlocal foldcolumn=0
  " tabbing
  autocmd FileType html setlocal softtabstop=2
  autocmd FileType html setlocal shiftwidth=2
  autocmd FileType html setlocal autoindent
  autocmd FileType html setlocal expandtab
  " misc
  autocmd FileType html setlocal breakindent
  autocmd FileType html setlocal colorcolumn=
augroup END

"===============================================================================
" javascript {{{1

augroup filetype_javascript
  autocmd!
  " folding
  autocmd FileType javascript setlocal foldenable
  autocmd FileType javascript setlocal foldmethod=syntax
  autocmd FileType javascript setlocal foldlevel=1
  autocmd FileType javascript setlocal foldnestmax=6
  autocmd FileType javascript setlocal foldcolumn=0
  " tabbing
  autocmd FileType javascript setlocal softtabstop=2
  autocmd FileType javascript setlocal shiftwidth=2
  autocmd FileType javascript setlocal autoindent
  autocmd FileType javascript setlocal expandtab
  " misc
  autocmd FileType javascript setlocal breakindent
  autocmd FileType javascript setlocal colorcolumn=81
augroup END

"===============================================================================
" markdown {{{1

" folding at '#' headers
function! MarkdownLevel()
  let h = matchstr(getline(v:lnum), '^#\+')
  if empty(h)
    return "="
  else
    return ">" . len(h)
  endif
endfunction

augroup filetype_markdown
  autocmd!
  " folding
  autocmd FileType markdown setlocal foldenable
  autocmd FileType markdown setlocal foldlevel=0
  autocmd FileType markdown setlocal foldnestmax=6
  autocmd FileType markdown setlocal foldcolumn=0
  autocmd BufEnter * if &filetype ==# 'markdown' | setlocal foldexpr=MarkdownLevel() | endif
  autocmd BufEnter * if &filetype ==# 'markdown' | setlocal foldmethod=expr | endif
  " misc
  autocmd FileType markdown setlocal syn=off
  autocmd FileType markdown setlocal breakindent
augroup END

"===============================================================================
" ruby {{{1

augroup filetype_ruby
  autocmd!
  " folding
  autocmd FileType ruby setlocal foldenable
  autocmd FileType ruby setlocal foldmethod=syntax
  autocmd FileType ruby setlocal foldlevel=1
  autocmd FileType ruby setlocal foldnestmax=6
  autocmd FileType ruby setlocal foldcolumn=0
  " tabbing
  autocmd FileType ruby setlocal softtabstop=2
  autocmd FileType ruby setlocal shiftwidth=2
  autocmd FileType ruby setlocal autoindent
  autocmd FileType ruby setlocal expandtab
  " misc
  autocmd FileType ruby setlocal breakindent
  autocmd FileType ruby setlocal colorcolumn=81
augroup END

"===============================================================================
" vim {{{1

augroup filetype_vim
  autocmd!
  " folding
  autocmd FileType vim setlocal foldenable
  autocmd FileType vim setlocal foldmethod=marker
  autocmd FileType vim setlocal foldlevel=0
  autocmd FileType vim setlocal foldnestmax=6
  autocmd FileType vim setlocal foldcolumn=0
  " tabbing
  autocmd FileType vim setlocal softtabstop=2
  autocmd FileType vim setlocal shiftwidth=2
  autocmd FileType vim setlocal autoindent
  autocmd FileType vim setlocal expandtab
  " misc
  autocmd FileType vim setlocal breakindent
  autocmd FileType vim setlocal colorcolumn=81
augroup END

"===============================================================================
" scss {{{1

augroup filetype_scss
  autocmd!
  " folding
  autocmd FileType scss setlocal foldenable
  autocmd BufRead,BufNewFile *.scss setlocal foldmethod=marker foldmarker={,}
  autocmd FileType scss setlocal foldlevel=0
  autocmd FileType scss setlocal foldnestmax=6
  autocmd FileType scss setlocal foldcolumn=0
  " tabbing
  autocmd FileType scss setlocal softtabstop=2
  autocmd FileType scss setlocal shiftwidth=2
  autocmd FileType scss setlocal autoindent
  autocmd FileType scss setlocal expandtab
  " misc
  autocmd FileType scss setlocal breakindent
augroup END

"===============================================================================
" yaml {{{1

augroup filetype_yaml
  autocmd!
  " folding
  autocmd FileType yaml setlocal foldenable
  autocmd FileType yaml setlocal foldmethod=syntax
  autocmd FileType yaml setlocal foldlevel=1
  autocmd FileType yaml setlocal foldnestmax=6
  autocmd FileType yaml setlocal foldcolumn=0
  " tabbing
  autocmd FileType yaml setlocal softtabstop=2
  autocmd FileType yaml setlocal shiftwidth=2
  autocmd FileType yaml setlocal autoindent
  autocmd FileType yaml setlocal expandtab
  " misc
  autocmd FileType yaml setlocal breakindent
  autocmd FileType yaml setlocal colorcolumn=81

  autocmd BufNewFile,BufRead *.yml setfiletype yaml
augroup END

"===============================================================================
" }}}1
