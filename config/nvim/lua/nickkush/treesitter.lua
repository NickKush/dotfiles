local success, treesitter = pcall(require, 'nvim-treesitter.configs')
if not success then
    return
end

treesitter.setup {
    ensure_installed = {
        'css',
        'html',
        'javascript',
        'json',
        'lua',
        'python',
        'typescript',
        'vue'
    },
    highlight = { enable = true },
}

