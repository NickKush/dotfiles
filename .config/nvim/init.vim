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

:set encoding=utf-8

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
Plug 'preservim/nerdtree'             " Nerd tree

" Color scheme
Plug 'gruvbox-community/gruvbox'     " Color scheme

" Telescope
Plug 'nvim-lua/plenary.nvim'          " Required lib
Plug 'nvim-telescope/telescope.nvim'  " Project finder
Plug 'nvim-telescope/telescope-fzy-native.nvim' " Fzf for telescope

" Undo tree
Plug 'mbbill/undotree'

" Commentary
Plug 'tpope/vim-commentary'

" LSP
Plug 'williamboman/nvim-lsp-installer'  " LSP Language server installer
Plug 'neovim/nvim-lspconfig'            " Enable LSP

" Autocomplete
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

call plug#end()

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

" Split buffers
nnoremap <silent> <leader>ss :split<cr><C-w>w<cr>
nnoremap <silent> <leader>sv :vsplit<cr><C-w>w<cr>

nnoremap <c-j> <c-w>j
nnoremap <c-h> <c-w>h
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

" Terminal keybinds
tnoremap <Esc> <c-\><c-n>

tnoremap <a-h> <c-\><c-n> <c-w>h
tnoremap <a-j> <c-\><c-n> <c-w>j
tnoremap <a-k> <c-\><c-n> <c-w>k
tnoremap <a-l> <c-\><c-n> <c-w>l



" --------------------------------------------------------------
"              - Plugins Settings -
" --------------------------------------------------------------
	
" highlightedyank
let g:highlightedyank_highlight_duration = 200  " Faster visual selection

" Nerd tree
nnoremap <F2> :NERDTree<CR>

let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'

" LSP Configuration


lua << EOF

require("nvim-lsp-installer").setup {
    ensure_installed = { 'pyright', 'rust_analyzer' },

    automatic_installation = false,
}


local opts = { noremap=true, silent=true }
vim.api.nvim_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
vim.api.nvim_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
end

local servers = { 'pyright', 'rust_analyzer' }
for _, lsp in pairs(servers) do
  require('lspconfig')[lsp].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,  -- This will be the default in neovim 0.7+
    }
  }
end

EOF


" Autocomplete

set completeopt=menu,menuone,noselect

lua << EOF

local cmp = require'cmp'


cmp.setup({
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),

    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
    }, {
      { name = 'buffer' },
    })
})

EOF
