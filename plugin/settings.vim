filetype plugin indent on
syntax on

"========== General Settings ==========
set encoding=utf-8

set tabstop=3
set shiftwidth=3
set expandtab

set autoindent
set backspace=indent,eol,start
set smarttab

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
