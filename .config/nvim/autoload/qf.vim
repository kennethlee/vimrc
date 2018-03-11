" LocListToggle / QuickfixToggle {{{1

function! qf#LocListToggle() abort
  let l:callback = "v:val.quickfix == 1 && v:val.loclist == 1"
  execute len(filter(getwininfo(), l:callback)) == 1 ? "lclose" : "lwindow"
endfunction

function! qf#QuickfixToggle() abort
  let l:callback = "v:val.quickfix == 1 && v:val.loclist == 0"
  " botright cwindow sets the qf window to be full-width
  execute len(filter(getwininfo(), l:callback)) == 1 ? "cclose" : "botright cwindow"
endfunction

" ==============================================================================
" :Keep, :Reject, :Restore, :Clear {{{1
" helpers {{{2
" s:ResetLists {{{3

" deletes every original list
function! s:ResetLists() abort
  if exists("b:qf_isLoc")
    if b:qf_isLoc == 1
      call setwinvar(winnr("#"), "qf_location_lists", [])
      call setwinvar(winnr("#"), "qf_location_titles", [])
    else
      let g:qf_quickfix_lists = []
      let g:qf_quickfix_titles = []
    endif
  endif
endfunction

" ==============================================================================
" s:SetList {{{3

function! s:SetList(pat, reject, strategy) abort
  " decide what regexp operator to use
  let operator   = a:reject == 0 ? '=~' : '!~'

  if exists("b:qf_isLoc")
    if b:qf_isLoc == 1
      " bufname && text
      if a:strategy == 0
        call setloclist(0, filter(getloclist(0), "(bufname(v:val['bufnr']) . v:val['text'] " . operator . " a:pat)"), "r")
      endif

      " only bufname
      if a:strategy == 1
        call setloclist(0, filter(getloclist(0), "bufname(v:val['bufnr']) " . operator . " a:pat"), "r")
      endif

      " only text
      if a:strategy == 2
        call setloclist(0, filter(getloclist(0), "v:val['text'] " . operator . " a:pat"), "r")
      endif
    else
      " bufname && text
      if a:strategy == 0
        call setqflist(filter(getqflist(), "(bufname(v:val['bufnr']) . v:val['text'] " . operator . " a:pat)"), "r")
      endif

      " only bufname
      if a:strategy == 1
        call setqflist(filter(getqflist(), "bufname(v:val['bufnr']) " . operator . " a:pat"), "r")
      endif

      " only text
      if a:strategy == 2
        call setqflist(filter(getqflist(), "v:val['text'] " . operator . " a:pat"), "r")
      endif
    endif
  endif
endfunction

" ==============================================================================
" s:AddList {{{3

function! s:AddList() abort
  if exists("b:qf_isLoc")
    if b:qf_isLoc == 1
      let locations = getwinvar(winnr("#"), "qf_location_lists")

      if len(locations) > 0
        call add(locations, getloclist(0))
        call setwinvar(winnr("#"), "qf_location_lists", locations)
      else
        call setwinvar(winnr("#"), "qf_location_lists", [getloclist(0)])
      endif
    else
      if exists("g:qf_quickfix_lists")
        let g:qf_quickfix_lists = add(g:qf_quickfix_lists, getqflist())
      else
        let g:qf_quickfix_lists = [getqflist()]
      endif
    endif
  endif
endfunction

" ==============================================================================
" s:SetTitle {{{3

" sets the proper title for the current window after :Keep and :Reject
"   - location window:
"       :lgrep foo sample.txt [keep: 'bar']
"       :lgrep foo sample.txt [reject: 'bar']
"   - quickfix window:
"       :grep foo sample.txt [keep: 'bar']
"       :grep foo sample.txt [reject: 'bar']
function! s:SetTitle(pat, reject) abort
  " did we use :Keep or :Reject?
  let str = a:reject == 0 ? "keep" : "reject"

  if exists("b:qf_isLoc")
    if b:qf_isLoc == 1
      let w:quickfix_title = getwinvar(winnr("#"), "qf_location_titles")[0] . " [" . str . ": '" . a:pat . "']"
    else
      if exists("g:qf_quickfix_titles")
        if len(g:qf_quickfix_titles) > 0
          let w:quickfix_title = g:qf_quickfix_titles[0] . " [" . str . ": '" . a:pat . "']"
        else
          let w:quickfix_title = w:quickfix_title . " [" . str . ": '" . a:pat . "']"
        endif
      else
        let w:quickfix_title = w:quickfix_title . " [" . str . ": '" . a:pat . "']"
      endif
    endif
  endif
endfunction

" ==============================================================================
" s:AddTitle {{{3

" store the current title
function! s:AddTitle(title) abort
  if exists("b:qf_isLoc")
    if b:qf_isLoc == 1
      let titles = getwinvar(winnr("#"), "qf_location_titles")

      if len(titles) > 0
        call add(titles, a:title)
        call setwinvar(winnr("#"), "qf_location_titles", titles)
      else
        call setwinvar(winnr("#"), "qf_location_titles", [a:title])
      endif
    else
      if exists("g:qf_quickfix_titles")
        let g:qf_quickfix_titles = add(g:qf_quickfix_titles, a:title)
      else
        let g:qf_quickfix_titles = [a:title]
      endif
    endif
  endif
endfunction

" ==============================================================================
" FilterList {{{2

function! qf#FilterList(pat, reject) abort
  let strategy  = get(g:, 'qf_bufname_or_text', 0)
  let pat       = ''

  if a:pat != ''
    let pat = a:pat
  else
    if col('.') == 1
      let pat      = split(getline('.'), '|')[0]
      let strategy = 1
    else
      let pat      = expand('<cword>')
      let strategy = 2
    endif
  endif

  if exists("b:qf_isLoc")
    call s:AddList()
    call s:AddTitle(get(w:, 'quickfix_title', ' '))

    call s:SetList(pat, a:reject, strategy)

    call s:SetTitle(pat, a:reject)
    call s:AddTitle(get(w:, 'quickfix_title', ' '))
  endif
endfunction

" ==============================================================================
" RestoreList {{{2

function! qf#RestoreList() abort
  if exists("b:qf_isLoc")
    if b:qf_isLoc == 1
      let lists = getwinvar(winnr("#"), "qf_location_lists")

      if len(lists) > 0
        let w:quickfix_title = strpart(getwinvar(winnr("#"), "qf_location_titles")[0], 1)
        call setloclist(0, getwinvar(winnr("#"), "qf_location_lists")[0], "r", w:quickfix_title)
      else
        echo "No filter applied. Nothing to restore."
      endif
    else
      if exists("g:qf_quickfix_lists")
        if len(g:qf_quickfix_lists) > 0
          let w:quickfix_title = strpart(g:qf_quickfix_titles[0], 1)
          call setqflist(g:qf_quickfix_lists[0], "r", w:quickfix_title)
        else
          echo "No filter applied. Nothing to restore."
        endif
      endif
    endif
  endif

  call s:ResetLists()
endfunction

" ==============================================================================
" ReuseTitle {{{2

" replace the current title
function! qf#ReuseTitle() abort
  if exists("b:qf_isLoc")
    if b:qf_isLoc == 1
      let titles = getwinvar(winnr("#"), "qf_location_titles")

      if len(titles) > 0
        let w:quickfix_title = getwinvar(winnr("#"), "qf_location_titles")[0]"
      endif
    else
      if exists("g:qf_quickfix_titles")
        if len(g:qf_quickfix_titles) > 0
          let w:quickfix_title = g:qf_quickfix_titles[0]
        endif
      endif
    endif
  endif
endfunction

" ==============================================================================
" Clear {{{2

function! qf#LocListClear() abort
  call setloclist(winnr(), [])
  lclose
endfunction

function! qf#QuickfixClear() abort
  call setqflist([])
  cclose
endfunction

" ==============================================================================
" }}}1

