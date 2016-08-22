filetype plugin indent on
syntax on

"========== General Settings ==========
set encoding=utf-8

set expandtab
set shiftwidth=4
set softtabstop=4
set smarttab

set backspace=indent,eol,start

set nrformats-=octal
set ttimeout
set ttimeoutlen=100

set incsearch
set hls
set showmatch

set laststatus=2
set wildmenu

set autoread

"========== Appearance =========="
set lazyredraw

set nowrap
set lbr
set diffopt+=iwhite,icase

set noerrorbells
set novisualbell

if has('gui_running')
    set spell
    set cursorline
    set lines=60 columns=140

    set guioptions-=T "remove toolbar
    set guioptions-=m "remove menu bar
endif

set nocompatible
set nu
set list listchars=tab:»·,trail:-,extends:>,precedes:<,eol:¬

" ColorScheme
if has('gui_running')
    color phoenix
else
    color slate
endif

"========== Gutentags Settings =========="
let g:gutentags_project_root = ['Makefile']

"========== Undotree Settings =========="
if has('win32') || has ('win64')
    let $VIMHOME = $HOME."/vimfiles"
else
    let $VIMHOME = $HOME."/.vim"
endif

" Persistent undo
if has("persistent_undo")
    let undodir = expand("$VIMHOME/undo")
    if !isdirectory(undodir)
        call mkdir(undodir)
    endif
    set undodir=$VIMHOME/undo
    set undofile
endif


"========== Indentation =========="
function! CppNoTemplateIndent()
    let l:cline_num = line('.')
    let l:cline = getline(l:cline_num)
    let l:pline_num = prevnonblank(l:cline_num - 1)
    let l:pline = getline(l:pline_num)
    while l:pline =~# '\(^\s*{\s*\|^\s*//\|^\s*/\*\|\*/\s*$\)'
        let l:pline_num = prevnonblank(l:pline_num - 1)
        let l:pline = getline(l:pline_num)
    endwhile
    let l:retv = cindent('.')
    let l:pindent = indent(l:pline_num)
    if l:pline =~# '^\s*template\s*<.\{-}>\s*$'
        let l:retv = l:pindent
    endif
    return l:retv
endfunc

set indentexpr=CppNoTemplateIndent()

"========== Switch Headers =========="
nmap <leader>aa :A<CR>
nmap <leader>as :A<CR>
nmap <leader>av :A<CR>
