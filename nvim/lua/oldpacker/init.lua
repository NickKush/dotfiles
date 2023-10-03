
require('oldpacker.opts')
require('oldpacker.keymaps')
require('oldpacker.plugins')

require('oldpacker.colors')
require('oldpacker.autocommands')

-- Lsp
require('oldpacker.lsp.lsp-signature')
require('oldpacker.lsp.lspconfig')
require("oldpacker.lsp.null-ls")

-- Plugins
require('oldpacker.lualine')
require('oldpacker.cmp')
require('oldpacker.git')
require('oldpacker.telescope')
require('oldpacker.nvim-tree')
require('oldpacker.treesitter')




require('oldpacker.lsp.metals')
