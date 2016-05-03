if exists('g:loaded_maxxMappings') || &compatible
   finish
else
   let g:loaded_maxxMappings = 1
endif

" Unmap the arrow keys
no <down>  ddp
no <up>    ddkP
no <left>  <Nop>
no <right> <Nop>
ino <down>  <Nop>
ino <up>    <Nop>
ino <left>  <Nop>
ino <right> <Nop>
vno <down>  <Nop>
vno <up>    <Nop>
vno <left>  <Nop>
vno <right> <Nop>

"============ Custom Mappings ========
" Help with split screen movement
nmap <silent> <C-J> :wincmd j<CR>
nmap <silent> <C-K> :wincmd k<CR>
nmap <silent> <C-H> :wincmd h<CR>
nmap <silent> <C-L> :wincmd l<CR>

"NERDTree"
map <silent> <C-n> :NERDTreeToggle<CR>

" Toggle Tag Views
map <silent> <F1> :TlistToggle<CR>
map <silent> <F2> :TagbarToggle<CR>

" Toggle undo tree view
nnoremap <F5> :UndotreeToggle<CR>

" Switch between header and source file
map <F4> :A<CR>

" Map to personal functions in functions.vim
nmap <leader>t :call Format_WhiteSpace_RemoveTrailing()<CR>
nmap <leader><leader>c :call Format_Inflection_ToCamelCase()<CR>
nmap <leader><leader>u :call Format_Inflection_ToUnderscored()<CR>
