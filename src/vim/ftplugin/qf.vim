" clean up quickfix (e.g., Ack) output
setlocal colorcolumn=0 nolist nocursorline nowrap

" Browse through quickfix history
nnoremap <buffer> <Left> :colder<CR>
nnoremap <buffer> <Right> :cnewer<CR>
