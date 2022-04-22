" Use bin bash as shell
set shell=/bin/bash


" --------------------------------------------------------------
"              - Basic parameters -
" --------------------------------------------------------------
    
:set relativenumber    " Show line number on the current line and relative numbers on all other lines
:set autoindent        " New lines inherit the indentation of previous lines.
:set tabstop=4         " Visual tab with 4 space width 
:set softtabstop=4     " Show tab with 4 space width when added
:set expandtab         " User spaces, not tabs
:set shiftwidth=4      " When shifting, indent using four spaces
:set smarttab          " Insert “tabstop” number of spaces when the “tab” key is pressed
:set mouse=a           " Enable mouse for scrolling and resizing
:set guicursor=        " I prefer big caret in `Insert mode`


" --------------------------------------------------------------
"              - Plugins -
" --------------------------------------------------------------
	
call plug#begin()

" Gui enchancements
Plug 'itchyny/lightline.vim'          " Status bar
Plug 'machakann/vim-highlightedyank'  " Highligh yank zone
Plug 'morhetz/gruvbox'                " Color scheme

call plug#end()


" --------------------------------------------------------------
"              - Plugins Settings -
" --------------------------------------------------------------
	
let g:highlightedyank_highlight_duration = 200  " Faster visual selection


" --------------------------------------------------------------
"              - Colors -
" --------------------------------------------------------------

let g:gruvbox_invert_selection='0'  " Better selection color https://github.com/morhetz/gruvbox/issues/15
colorscheme gruvbox
	

" --------------------------------------------------------------
"              - Keybinding - 
" --------------------------------------------------------------
let mapleader = " "

" Reset arrow keys because I can
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" Copy to clipboard
vnoremap  <leader>y  "+y

" Paste from clipboard
nnoremap <leader>p "+p
