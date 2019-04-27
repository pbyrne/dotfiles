setlocal wrap spell

" Open the current file with the :Marked command
command! Marked silent exe "!open -a 'Marked 2.app' '%:p'" | redraw!

" create first- and second-level markdown headings
" copy the current line to the line below, replace with an equal number of =
noremap <Leader>1 yypVr=
noremap <Leader>2 yypVr-
