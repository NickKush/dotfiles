

vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
    use 'wbthomason/packer.nvim'
    
    -- Color scheme
    use "gruvbox-community/gruvbox"
end)
