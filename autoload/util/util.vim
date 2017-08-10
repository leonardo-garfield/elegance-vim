fu! util#util#source_rc(file) abort
    if filereadable(g:config_dir. '/' . a:file)
        execute 'source ' . g:config_dir  . '/' . a:file
    endif
endf
