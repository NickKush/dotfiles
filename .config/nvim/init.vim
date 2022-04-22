" Use bin bash as shell
set shell=/bin/bash


" --------------------------------------------------------------
"              - Basic parameters -
" --------------------------------------------------------------

:set number            " Show line number
:set relativenumber    " Show line number on the current line and relative numbers on all other lines

:set autoindent        " New lines inherit the indentation of previous lines.

:set tabstop=4         " Visual tab with 4 space width 
:set softtabstop=4     " Show tab with 4 space width when added
:set expandtab         " User spaces, not tabs
:set shiftwidth=4      " When shifting, indent using four spaces
:set smarttab          " Insert “tabstop” number of spaces when the “tab” key is pressed

:set mouse=a           " Enable mouse for scrolling and resizing
:set guicursor=        " I prefer big caret in `Insert mode`
:set noerrorbells      " I don't like this sound...
:set scrolloff=8       " Offset buffer scroll

" :set nohlsearch        " Don't highlight search results

:set hidden            " Buffer is not unloaded when you close current buffer

:set noswapfile               " Don't store swap file
:set nobackup                 " Don't store backup file
:set undodir=~/.vim/undo_dir  " Store undo history in this directory
:set undofile                 " Use undo file

" --------------------------------------------------------------
"              - Plugins -
" --------------------------------------------------------------
	
call plug#begin()

" Gui enchancements
Plug 'itchyny/lightline.vim'          " Status bar
Plug 'machakann/vim-highlightedyank'  " Highligh yank zone

" Color scheme
Plug 'gruvbox-community/gruvbox'     " Color scheme

" Telescope
Plug 'https://github.com/nvim-lua/plenary.nvim'          " Required lib
Plug 'https://github.com/nvim-telescope/telescope.nvim'  " Project finder
Plug 'https://github.com/nvim-telescope/telescope-fzy-native.nvim' " Fzf for telescope

" Undo tree
Plug 'https://github.com/mbbill/undotree'

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

" Reset arrow keys. Use the 'vim' keymap
nnoremap <Up> <Nop>
nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>
inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>

" Copy to clipboard
vnoremap  <leader>y  "+y

" Paste from clipboard
nnoremap <leader>p "+p

" Ctrl+H to stop searching (eg. CancelHighligh)
vnoremap <C-h> :nohlsearch<cr>
nnoremap <C-h> :nohlsearch<cr>



