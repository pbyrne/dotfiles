augroup overwrite-rhubarb-default
  autocmd!
  autocmd BufNewFile,BufRead PULLREQ_EDITMSG set syntax=markdown ft=markdown
augroup END
