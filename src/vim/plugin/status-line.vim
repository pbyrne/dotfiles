function! PJB_VCSStatusLine()
  let l:status = system("git vim-status")
  return strlen(l:status) > 0?'['.l:status.']':''
endfunction

" clear the deck
set statusline=
" git status, highlighted
set statusline+=%#PmenuSel#
set statusline+=%{FugitiveStatusline()}
set statusline+=%#StatusLine#
" current filename, truncate from the left if too long to fit
set statusline+=\ %<%f
" left/right divider
set statusline+=%=
" help status
set statusline+=%h
" modified flag
set statusline+=%m
" readonly flag
set statusline+=%r
" filetype
set statusline+=%y
" line and column
set statusline+=\ %-8.(%l,%c%V%)
" percentage through file
set statusline+=\ %P
