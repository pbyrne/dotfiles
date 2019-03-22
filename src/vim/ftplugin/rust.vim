" Run the current project
:map <leader>r :wa<cr>:!cargo run<cr>

" Run the current standalone binary file
" Calling form src/bin/foo.rs triggers with --bin=foo
:map <leader>R :wa<cr>:!cargo run --bin=%:t:r<cr>
