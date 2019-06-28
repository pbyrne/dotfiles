if executable('ag')
  set grepprg=ag\ --vimgrep\ --nogroup\ --nocolor
  set grepformat=%f:%l:%c:%m,%f:%l:%m
endif

" Let's use fzf's `:Ag` for a bit
" command! -nargs=+ Ag execute 'silent grep! <args>' | copen | redraw!

