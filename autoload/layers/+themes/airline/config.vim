scriptencoding=utf-8

" vim-airline {
""  let g:airline_theme='deus'
  let g:airline_theme='badwolf'
""  let g:Powerline_symbols='fancy'



  let g:airline_powerline_fonts = 0
  let g:airline#extensions#tabline#enabled=1
  let g:airline#extensions#tabline#buffer_idx_mode = 1
  let g:airline#extensions#tabline#buffer_nr_show = 1
  let g:airline#extensions#tabline#buffer_nr_format = '%s:'
  let g:airline#extensions#tabline#fnamemod = ':t'
  let g:airline#extensions#tabline#fnamecollapse = 1
  let g:airline#extensions#tabline#fnametruncate = 0
  let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
  let g:airline#extensions#tagbar#enabled = 0
  " Distinct background color is enough to discriminate the warning and
  " error information.
  let g:airline#extensions#ale#error_symbol = '•'
  let g:airline#extensions#ale#warning_symbol = '•'
" }
