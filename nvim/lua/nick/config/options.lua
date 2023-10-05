local opt = vim.opt  -- Options

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.loaded_netrw       = 1
vim.g.loaded_netrwPlugin = 1

-- General --

opt.encoding = "utf-8"
opt.mouse = "a"        -- Enable mouse for scrolling and resizing
opt.guicursor = ""    -- I prefer thicc caret in insert mode
opt.swapfile = false   -- Don't save swap file
opt.errorbells = true  -- Disable the terminal sound
opt.backup = false     -- Don't save backup file
opt.undofile = true    -- Use undo files (for plugins and etc)
opt.undodir = os.getenv("HOME") .. "/.vim/undo_dir"  -- Store undo files in that directory
opt.hidden = true    -- Buffer is not unloaded when you close a buffer
opt.updatetime = 50  -- Default value is 4000ms, and it's a poop
opt.clipboard = 'unnamedplus'  -- Copy/paste to system clipboard
-- opt.completeopt = { "menuone", "noselect" }  -- For cmp

-- UI --
opt.number = true           -- Show line number
opt.relativenumber = true   -- Show line number on the current line and relative numbers on all other lines
opt.laststatus = 3          -- Global status line
opt.scrolloff = 8           -- Offset buffer scroll
opt.signcolumn = "yes"      --
opt.termguicolors = true    -- Enable 24-bit color mode

-- Tabs, indent --
opt.smartindent = true  -- New lines inherit the indentation of previous lines.
opt.shiftwidth = 4      -- When shifting, indent using four spaces
opt.tabstop = 4         -- Visual tab with 4 space width
opt.softtabstop = 4     -- Show tab with 4 space width when added
opt.expandtab = true    -- User spaces, not tabs
opt.smarttab = true     -- Insert “tabstop” number of spaces when the “tab” key is pressed

