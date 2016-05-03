if exists('g:loaded_maxxSettings') || &compatible
   finish
else
   let g:loaded_maxxSettings = 1
endif

filetype plugin indent on
syntax on

"========== General Settings ==========
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
"set ruler not needed when using lightline
set wildmenu

if &encoding ==# 'latin1' && has('gui_running')
  set encoding=utf-8
endif

set autoread
"set termencoding=utf-8
"set fileencodings=ucs-bom,ascii,utf-8,latin1

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

if has('win32') || has('win64')
   let $VIMHOME = $HOME."/vimfiles"
else
   let $VIMHOME = $HOME."/.vim"
endif

" ColorScheme
if has('gui_running')
   color phoenix
else
   color slate
endif
"========== Gutentags Settings =========="
let g:gutentags_project_root = ['Makefile']


"========== Undotree Settings =========="

" Persistent undo
if has("persistent_undo")
   let undodir = expand("$VIMHOME/undo")
   if !isdirectory(undodir)
      call mkdir(undodir)
   endif
   set undodir=$VIMHOME/undo
   set undofile
endif
