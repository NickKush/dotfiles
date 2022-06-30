-- Setup lsp installer first

local success, lsp_installer = pcall(require, 'nvim-lsp-installer')
if not success then
    return
end

local servers = {
    'pyright',
    'tsserver',
    'tailwindcss',
    'vuels',
}

lsp_installer.setup {
    ensure_installed = servers,

    automatic_installation = false
}



-- Setup LSP config

local success, lsp_config = pcall(require, 'lspconfig')
if not success then
    return
end

-- Mapping
local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

keymap('n', '<space>e', vim.diagnostic.open_float, opts)
keymap('n', '[d', vim.diagnostic.goto_prev, opts)
keymap('n', ']d', vim.diagnostic.goto_next, opts)
keymap('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { noremap=true, silent=true, buffer=bufnr }
    keymap('n', 'gD', vim.lsp.buf.declaration, bufopts)
    keymap('n', 'gd', vim.lsp.buf.definition, bufopts)
    keymap('n', 'K', vim.lsp.buf.hover, bufopts)
    keymap('n', 'gi', vim.lsp.buf.implementation, bufopts)
    keymap('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    keymap('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
    keymap('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
    keymap('n', '<space>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)
    keymap('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
    keymap('n', '<space>rn', vim.lsp.buf.rename, bufopts)
    keymap('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
    keymap('n', 'gr', vim.lsp.buf.references, bufopts)
    -- keymap('n', '<space>f', vim.lsp.buf.formatting, bufopts)
end

local lsp_flags = {
    debounce_txt_changes = 150,
}

local opts = {}

for _, server in pairs(servers) do
    opts = {
        on_attach = on_attach,
        flags = lsp_flags,
    }
    -- print(server) 

    if server == "pyright" then
        local server_opts = {
            settings = {
                python = {
                    analysis = {
                        useLibraryCodeForTypes = true,
                    },
                    venvPath = "./venv"
                }
            }
        }
        opts = vim.tbl_deep_extend("force", server_opts, opts)
    end

    -- print(vim.inspect(opts))

    lsp_config[server].setup(opts)
end

