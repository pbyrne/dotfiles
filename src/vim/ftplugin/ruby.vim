" For some reason, iskeyword gets set differently sometimes on ruby files,
" not splitting on '.' or ':', which makes namespaces and methods names a
" pain to autocomplete or modify. This ensures that iskeyword is always
" consistent until I figure out what's going wrong.
autocmd FileType ruby set iskeyword=@,48-57,_,192-255


