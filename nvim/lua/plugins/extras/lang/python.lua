return {
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      -- Remove ruff-lsp
      table.remove(opts.servers, 4)
      table.remove(opts.setup, 1)
    end,
  },
}
