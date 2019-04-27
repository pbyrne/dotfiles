function! ResetCursor()
  if line("'\"") <= line("$") && &filetype != "gitcommit"
    normal! g`"
    return 1
  endif
endfunction

if has("autocmd")
  " Remember last location in file
  autocmd BufReadPost * call ResetCursor()
end
