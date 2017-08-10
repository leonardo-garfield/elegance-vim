"TagBar              tags标签浏览器
let g:tagbar_sort = 0                          " 关闭排序 [也就是按标签本身在文件中的位置排序]
let g:tagbar_show_linenumbers = -1             " 显示行号 [使用全局关于行号的默认配置]
let g:tagbar_autopreview = 1                   " 开启自动预览 [随着光标在标签上的移动，顶部会出现一个实时的预览窗口]
" tagbar {
""let g:tagbar_autofocus = 1
""nmap <leader>tl :TagbarToggle<cr><c-w><c-l>
nnoremap <F9> :TagbarToggle<CR>
inoremap <F9> <ESC>:TagbarToggle<CR>
nnoremap <Leader>tt :TagbarToggle<CR>
" }


