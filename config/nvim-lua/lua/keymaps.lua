local keymap = vim.api.nvim_set_keymap

local opts = { noremap = true, silent = true }


-- Leader is a spacebar
vim.g.mapleader = ' ' 



-- Disable arrow keys
keymap('', '<up>', '<nop>', opts);
keymap('', '<down>', '<nop>', opts);
keymap('', '<left>', '<nop>', opts);
keymap('', '<right>', '<nop>', opts);


