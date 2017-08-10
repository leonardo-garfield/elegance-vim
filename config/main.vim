let g:config_dir = fnamemodify(expand('<sfile>'), ':p:h:gs?\\?'.((has('win16') || has('win32') || has('win64'))?'\':'/') . '?')
" initialization "
call util#util#source_rc('init.vim')
" setting layers "
call util#util#source_rc('layer.vim')
" other configuration "
call util#util#source_rc('config.vim')
" key mapping "
call util#util#source_rc('mapping.vim')

