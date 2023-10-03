-- install lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

-- setup config
require('nick.config.options')
require('nick.config.autocmds')
require('nick.config.keymaps')


-- setup lazy
require("lazy").setup({
  spec = {
   { import = "nick.plugins" },
   { import = "nick.plugins.lang" },
  },

  install = {
   colorscheme = { "catppuccin-mocha" }
  },

  checker = {
    enabled = false,
  },

  change_detection = {
    notify = false
  }
})
