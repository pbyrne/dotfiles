if executable('ag')
  " Use ag for built-in grep commands
  set grepprg=ag\ --vimgrep\ --nogroup\ --nocolor
  set grepformat=%f:%l:%c:%m,%f:%l:%m

  " Configure ack.vim to use ag instead
  let g:ackprg = 'ag --vimgrep'
endif

