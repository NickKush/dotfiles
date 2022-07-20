local success, cmp = pcall(require, "cmp")
if not success then
    return
end

local success, luasnip = pcall(require, "luasnip")
if not success then
    return
end

require("luasnip.loaders.from_vscode").lazy_load()

-- Basic setup
cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },

    mapping = cmp.mapping.preset.insert({
      ["<c-k>"] = cmp.mapping.select_prev_item(),
      ["<c-j>"] = cmp.mapping.select_next_item(),
      ["<c-b>"] = cmp.mapping.scroll_docs(-4),
      ["<c-f>"] = cmp.mapping.scroll_docs(4),
      ["<c-space>"] = cmp.mapping.complete(),
      ["<c-e>"] = cmp.mapping.abort(),
      ["<cr>"] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    
    sources = {
        { name = "nvim_lsp", group_index = 1 },
        { name = "luasnip", group_index = 1 },

        { name = "buffer", group_index = 2 },

    }
    -- sources = cmp.config.sources({
    --     { name = "nvim_lsp" },
    --     { name = "luasnip" },
    -- },
    -- {
    --     { name = "buffer" }
    -- }),
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
        { name = 'cmdline' }
    })
})

