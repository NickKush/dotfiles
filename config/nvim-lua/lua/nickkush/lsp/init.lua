local success, _ = pcall(require, 'lspconfig')
if not success then
    return
end

require('nickkush.lsp.lsp-signature')
require('nickkush.lsp.lspconfig')
-- require("nickkush.lsp.null-ls")
