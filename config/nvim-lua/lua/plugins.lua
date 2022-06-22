

vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
    use 'wbthomason/packer.nvim'
    
    -- Color scheme
    use "gruvbox-community/gruvbox"

    -- Commentary
    use "tpope/vim-commentary"

    -- Gui echancements
    use "machakann/vim-highlightedyank"

    -- LSP
    use "williamboman/nvim-lsp-installer"  -- lsp server installer
    use "neovim/nvim-lspconfig"   -- enable lsp
end)
