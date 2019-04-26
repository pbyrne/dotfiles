if executable('ag')
  set grepprg=ag\ --vimgrep\ --nogroup\ --nocolor
  set grepformat=%f:%l:%c:%m,%f:%l:%m
endif

command! -nargs=+ Ag execute 'silent grep! <args>' | copen | redraw!

