local success, treesitter = pcall(require, 'nvim-treesitter.configs')
if not success then
    return
end

treesitter.setup {
    ensure_installed = {
        'bash',
        'css',
        'help',
        'html',
        'javascript',
        'json',
        'lua',
        'python',
        'typescript',
        'vim',
        'vue'
    },

    highlight = {
        enable = true,

        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false
    },
}


local success, ts_context = pcall(require, 'treesitter-context')
if not success then
    return
end

ts_context.setup({
    enable = true,

    patterns = {  -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
        default = {
           'class',
           'function',
           'method'
        }
    }

})

