" function! StatuslineGit()
"   let l:branchname = system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
"   return strlen(l:branchname) > 0?'  ['.l:branchname.'] ':''
" endfunction

" clear the deck
set statusline=
" git status, highlighted
set statusline+=%#PmenuSel#
set statusline+=%{FugitiveStatusline()}
set statusline+=%#StatusLine#
" path to file
set statusline+=\ %f
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
set statusline+=\ %-14.(%l,%c%v%)
" percentage through file
set statusline+=\ %P
