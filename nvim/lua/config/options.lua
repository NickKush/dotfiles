-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

opt.scrolloff = 8 -- Lines of context
opt.shiftwidth = 4
opt.tabstop = 4 -- Number of spaces tabs count for

opt.swapfile = false -- Don't save swap file

opt.wrap = true

vim.g.snacks_animate = false -- disable all 'snacks' animations
