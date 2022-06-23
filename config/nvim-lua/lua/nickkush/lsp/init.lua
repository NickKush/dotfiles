local success, _ = pcall(require, 'lspconfig')
if not success then
    return
end

require('nickkush.lsp.lspconfig')
