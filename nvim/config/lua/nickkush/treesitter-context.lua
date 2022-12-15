local success, context = pcall(require, 'treesitter-context')
if not success then
    return
end

context.setup({
    enable = true,

    patterns = {  -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
        default = {
           'class',
           'function',
           'method'
        }
    }

})


