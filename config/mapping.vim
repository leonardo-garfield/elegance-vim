" vim: et ts=2 sts=2 sw=2

scriptencoding utf-8


let s:save_cpo = &cpo
set cpo&vim
" Visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv
" Treat long lines as break lines (useful when moving around in them)
nmap j gj
nmap k gk
vmap j gj
vmap k gk


" Key (re)Mappings {

  if !exists('g:key_mapping') ||
        \ g:key_mapping

    " Basic {
      if !exists('g:basic_key_mapping') ||
            \ g:basic_key_mapping
        " Quit normal mode
        nnoremap <Leader>q  :q<CR>
        nnoremap <Leader>Q  :qa!<CR>
        " Move half page faster
        nnoremap <Leader>d  <C-d>
        nnoremap <Leader>u  <C-u>
        " Insert mode shortcut
        inoremap <C-h> <BS>
        inoremap <C-j> <Down>
        inoremap <C-k> <Up>
        inoremap <C-b> <Left>
        inoremap <C-f> <Right>
        " Bash like
        inoremap <C-a> <Home>
        inoremap <C-e> <End>
        inoremap <C-d> <Delete>
        " Command mode shortcut
 ""       cnoremap <C-h> <BS>
 ""       cnoremap <C-j> <Down>
 ""       cnoremap <C-k> <Up>
 ""       cnoremap <C-b> <Left>
 ""       cnoremap <C-f> <Right>
 ""       cnoremap <C-a> <Home>
 ""       cnoremap <C-e> <End>
 ""       cnoremap <C-d> <Delete>
        " jk | escaping
        inoremap jj <Esc>
        inoremap jk <Esc>
        cnoremap jj <C-c>
        cnoremap jk <C-c>
        " Quit visual mode
        vnoremap v <Esc>
        " Move to the start of line
        nnoremap H ^
        " Move to the end of line
        nnoremap L $
        " Redo
        nnoremap U <C-r>
        " Quick command mode
""        nnoremap <CR> :
        " Yank to the end of line
        nnoremap Y y$
       " Auto indent pasted text
        " nnoremap p p=`]<C-o>
        " Open shell in vim
        map <Leader>' :shell<CR>
        " Search result highlight countermand
        nnoremap <Leader>sc :nohlsearch<CR>
        " Toggle pastemode
        nnoremap <Leader>tp :setlocal paste!<CR>
      endif
    " }

    " Buffer {
      if !exists('g:buffer_key_mapping') ||
            \ g:buffer_key_mapping
        nnoremap <Leader>bp :bprevious<CR>
        nnoremap <Leader>bn :bnext<CR>
        nnoremap <Leader>bf :bfirst<CR>
        nnoremap <Leader>bl :blast<CR>
        nnoremap <Leader>bd :bd<CR>
        nnoremap <Leader>bk :bw<CR>
      endif
    " }

    " File {
      if !exists('g:file_key_mapping') ||
            \ g:file_key_mapping
        " File save
        nnoremap <Leader>fs :update<CR>
      endif
    " }

    " Fold {
      if !exists('g:fold_key_mapping') ||
            \ g:fold_key_mapping
        nnoremap <Leader>f0 :set foldlevel=0<CR>
        nnoremap <Leader>f1 :set foldlevel=1<CR>
        nnoremap <Leader>f2 :set foldlevel=2<CR>
        nnoremap <Leader>f3 :set foldlevel=3<CR>
        nnoremap <Leader>f4 :set foldlevel=4<CR>
        nnoremap <Leader>f5 :set foldlevel=5<CR>
        nnoremap <Leader>f6 :set foldlevel=6<CR>
        nnoremap <Leader>f7 :set foldlevel=7<CR>
        nnoremap <Leader>f8 :set foldlevel=8<CR>
        nnoremap <Leader>f9 :set foldlevel=9<CR>
      endif
    " }

    " Window {
      if !exists('g:window_key_mapping') ||
            \ g:window_key_mapping
        nnoremap <Leader>ww <C-W>w
        nnoremap <Leader>wr <C-W>r
        nnoremap <Leader>wd <C-W>c
        nnoremap <Leader>wq <C-W>q
        nnoremap <Leader>wj <C-W>j
        nnoremap <Leader>wk <C-W>k
        nnoremap <Leader>wh <C-W>h
        nnoremap <Leader>wl <C-W>l
        nnoremap <Leader>wH <C-W>5<
        nnoremap <Leader>wL <C-W>5>
        nnoremap <Leader>wJ :resize +5<CR>
        nnoremap <Leader>wK :resize -5<CR>
        nnoremap <Leader>w= <C-W>=
        nnoremap <Leader>ws <C-W>s
        nnoremap <Leader>w- <C-W>s
        nnoremap <Leader>wv <C-W>v
        nnoremap <Leader>w\| <C-W>v
        nnoremap <Leader>w2 <C-W>v
      endif
    " }

  endif

" }


nnoremap <C-[> :pop <CR>
""nnoremap <c-a> :Ag <C-R>=expand("<cWORD>")<CR><CR>"")


" This tests to see if vim was configured with the '--enable-cscope' option
" when it was compiled.  If it wasn't, time to recompile vim... 
if has("cscope")

    """"""""""""" Standard cscope/vim boilerplate

    " use both cscope and ctag for 'ctrl-]', ':ta', and 'vim -t'
    set cscopetag

    " check cscope for definition of a symbol before checking ctags: set to 1
    " if you want the reverse search order.
    set csto=0

    " add any cscope database in current directory
    if filereadable("cscope.out")
        cs add cscope.out
    " else add the database pointed to by environment variable 
    elseif $CSCOPE_DB != ""
        cs add $CSCOPE_DB
    endif

    " show msg when any other cscope db added
    set cscopeverbose


    """"""""""""" My cscope/vim key mappings
    "
    " The following maps all invoke one of the following cscope search types:
    "
    "   's'   symbol: find all references to the token under cursor
    "   'g'   global: find global definition(s) of the token under cursor
    "   'c'   calls:  find all calls to the function name under cursor
    "   't'   text:   find all instances of the text under cursor
    "   'e'   egrep:  egrep search for the word under cursor
    "   'f'   file:   open the filename under cursor
    "   'i'   includes: find files that include the filename under cursor
    "   'd'   called: find functions that function under cursor calls
    "
    " Below are three sets of the maps: one set that just jumps to your
    " search result, one that splits the existing vim window horizontally and
    " diplays your search result in the new window, and one that does the same
    " thing, but does a vertical split instead (vim 6 only).
    "
    " I've used CTRL-\ and CTRL-@ as the starting keys for these maps, as it's
    " unlikely that you need their default mappings (CTRL-\'s default use is
    " as part of CTRL-\ CTRL-N typemap, which basically just does the same
    " thing as hitting 'escape': CTRL-@ doesn't seem to have any default use).
    " If you don't like using 'CTRL-@' or CTRL-\, , you can change some or all
    " of these maps to use other keys.  One likely candidate is 'CTRL-_'
    " (which also maps to CTRL-/, which is easier to type).  By default it is
    " used to switch between Hebrew and English keyboard mode.
    "
    " All of the maps involving the <cfile> macro use '^<cfile>$': this is so
    " that searches over '#include <time.h>" return only references to
    " 'time.h', and not 'sys/time.h', etc. (by default cscope will return all
    " files that contain 'time.h' as part of their name).


    " To do the first type of search, hit 'CTRL-\', followed by one of the
    " cscope search types above (s,g,c,t,e,f,i,d).  The result of your cscope
    " search will be displayed in the current window.  You can use CTRL-T to
    " go back to where you were before the search.  
    "

    nmap <C-s> :cs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <C-g> :cs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <C-c> :cs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <C-t> :cs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <C-e> :cs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <C-f> :cs find f <C-R>=expand("<cfile>")<CR><CR>
    nmap <C-i> :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    nmap <C-d> :cs find d <C-R>=expand("<cword>")<CR><CR>


    " Using 'CTRL-spacebar' (intepreted as CTRL-@ by vim) then a search type
    " makes the vim window split horizontally, with search result displayed in
    " the new window.
    "
    " (Note: earlier versions of vim may not have the :scs command, but it
    " can be simulated roughly via:
    "    nmap <C-@>s <C-W><C-S> :cs find s <C-R>=expand("<cword>")<CR><CR>	

""    nmap <C-@>s :scs find s <C-R>=expand("<cword>")<CR><CR>	
""    nmap <C-@>g :scs find g <C-R>=expand("<cword>")<CR><CR>	
""    nmap <C-@>c :scs find c <C-R>=expand("<cword>")<CR><CR>	
""    nmap <C-@>t :scs find t <C-R>=expand("<cword>")<CR><CR>	
""    nmap <C-@>e :scs find e <C-R>=expand("<cword>")<CR><CR>	
""    nmap <C-@>f :scs find f <C-R>=expand("<cfile>")<CR><CR>	
""    nmap <C-@>i :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>	
""    nmap <C-@>d :scs find d <C-R>=expand("<cword>")<CR><CR>	


    " Hitting CTRL-space *twice* before the search type does a vertical 
    " split instead of a horizontal one (vim 6 and up only)
    "
    " (Note: you may wish to put a 'set splitright' in your .vimrc
    " if you prefer the new window on the right instead of the left

""    nmap <C-@><C-@>s :vert scs find s <C-R>=expand("<cword>")<CR><CR>
""    nmap <C-@><C-@>g :vert scs find g <C-R>=expand("<cword>")<CR><CR>
""    nmap <C-@><C-@>c :vert scs find c <C-R>=expand("<cword>")<CR><CR>
""    nmap <C-@><C-@>t :vert scs find t <C-R>=expand("<cword>")<CR><CR>
""    nmap <C-@><C-@>e :vert scs find e <C-R>=expand("<cword>")<CR><CR>
""    nmap <C-@><C-@>f :vert scs find f <C-R>=expand("<cfile>")<CR><CR>	
""    nmap <C-@><C-@>i :vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>	
""    nmap <C-@><C-@>d :vert scs find d <C-R>=expand("<cword>")<CR><CR>


    """"""""""""" key map timeouts
    "
    " By default Vim will only wait 1 second for each keystroke in a mapping.
    " You may find that too short with the above typemaps.  If so, you should
    " either turn off mapping timeouts via 'notimeout'.
    "
    "set notimeout 
    "
    " Or, you can keep timeouts, by uncommenting the timeoutlen line below,
    " with your own personal favorite value (in milliseconds):
    "
    "set timeoutlen=4000
    "
    " Either way, since mapping timeout settings by default also set the
    " timeouts for multicharacter 'keys codes' (like <F1>), you should also
    " set ttimeout and ttimeoutlen: otherwise, you will experience strange
    " delays as vim waits for a keystroke after you hit ESC (it will be
    " waiting to see if the ESC is actually part of a key code like <F1>).
    "
    "set ttimeout 
    "
    " personally, I find a tenth of a second to work well for key code
    " timeouts. If you experience problems and have a slow terminal or network
    " connection, set it higher.  If you don't set ttimeoutlen, the value for
    " timeoutlent (default: 1000 = 1 second, which is sluggish) is used.
    "
    "set ttimeoutlen=100

endif



let &cpo = s:save_cpo
unlet s:save_cpo
