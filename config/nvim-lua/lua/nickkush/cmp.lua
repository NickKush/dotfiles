
local success, cmp = pcall(require, "cmp")
if not success then
    return
end

cmp.setup({
    mapping = cmp.mapping.preset.insert({
      ["<c-k>"] = cmp.mapping.select_prev_item(),
      ["<c-j>"] = cmp.mapping.select_next_item(),
      ["<c-b>"] = cmp.mapping.scroll_docs(-4),
      ["<c-f>"] = cmp.mapping.scroll_docs(4),
      ["<c-space>"] = cmp.mapping.complete(),
      ["<c-e>"] = cmp.mapping.abort(),
      ["<cr>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
    }, {
      { name = 'buffer' },
    })
})

