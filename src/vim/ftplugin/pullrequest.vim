setlocal spell

" create first- and second-level markdown headings
" copy the current line to the line below, replace with an equal number of =
noremap <Leader>1 yypVr=
noremap <Leader>2 yypVr-
