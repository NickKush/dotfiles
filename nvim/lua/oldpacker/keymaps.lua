local keymap = vim.api.nvim_set_keymap

local opts = { noremap = true, silent = true }


-- Map space as a leader key
keymap('', '<space>', '<nop>', opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "


-- Disable arrow keys
keymap('', '<up>', '<nop>', opts)
keymap('', '<down>', '<nop>', opts)
keymap('', '<left>', '<nop>', opts)
keymap('', '<right>', '<nop>', opts)

-- Split navigation
keymap('n', '<c-j>', '<c-w>j', opts)
keymap('n', '<c-h>', '<c-w>h', opts)
keymap('n', '<c-k>', '<c-w>k', opts)
keymap('n', '<c-l>', '<c-w>l', opts)

-- Resize with arrows keys
keymap('n', '<c-up>',    ':resize -4<cr>', opts)
keymap('n', '<c-down>',  ':resize +4<cr>', opts)
keymap('n', '<c-left>',  ':vertical resize -4<cr>', opts)
keymap('n', '<c-right>', ':vertical resize +4<cr>', opts)

-- Move text up and down
keymap("v", "<a-j>", "<esc>:m .+1<cr>", opts)
keymap("v", "<a-k>", "<esc>:m .-2<cr>", opts)

-- Identations
keymap('v', '<', '<gv', opts)
keymap('v', '>', '>gv', opts)


-- Stop search highlight (eg. CancelHighlight)
keymap('n', '<leader>h', ':nohlsearch<cr>', opts)

-- Terminal keybinds
keymap('t', '<esc>', '<c-\\><c-n>', opts)

keymap('t', '<a-j>', '<c-\\><c-n><c-w>j', opts)
keymap('t', '<a-h>', '<c-\\><c-n><c-w>h', opts)
keymap('t', '<a-k>', '<c-\\><c-n><c-w>k', opts)
keymap('t', '<a-l>', '<c-\\><c-n><c-w>l', opts)
