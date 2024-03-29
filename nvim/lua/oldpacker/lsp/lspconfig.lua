-- Setup lsp installer first

local success, lsp_installer = pcall(require, 'nvim-lsp-installer')
if not success then
    return
end

local success, lsp_config = pcall(require, 'lspconfig')
if not success then
    return
end

local success, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not success then
  return
end


lsp_installer.setup {
    ensure_installed = {
        'sumneko_lua',
        'pyright',
        'tsserver',
        'tailwindcss',
        'rust-analyzer',
        'vuels',
    },

    automatic_installation = false
}


-- Capabilities
local mcc = vim.lsp.protocol.make_client_capabilities()
local capabilities = cmp_nvim_lsp.default_capabilities(mcc)

-- Mapping
local keymap = vim.keymap.set
local keymap_opts = { noremap = true, silent = true }

keymap('n', '<space>e', vim.diagnostic.open_float, keymap_opts)
keymap('n', '[d', vim.diagnostic.goto_prev, keymap_opts)
keymap('n', ']d', vim.diagnostic.goto_next, keymap_opts)
keymap('n', '<space>q', vim.diagnostic.setloclist, keymap_opts)

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
--     keymap('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
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


local util = require("lspconfig/util")
local path = util.path

local function get_python_path(workspace)
  -- Use activated venv
  if vim.env.VIRTUAL_ENV then
    return path.join(vim.env.VIRTUAL_ENV, 'bin', 'python3')
  end

  -- Find and use virtualenv in workspace directory.
  for _, pattern in ipairs({'*', '.*'}) do
    local match = vim.fn.glob(path.join(workspace, pattern, 'pyvenv.cfg'))
    if match ~= '' then
      return path.join(path.dirname(match), 'bin', 'python3')
    end
  end

  -- Fallback to system Python.
  return exepath('python3') or exepath('python') or 'python3' or 'python'
end


-- easy to config servers
local servers = {
    'tsserver',
    'tailwindcss',
}


for _, server in pairs(servers) do
    lsp_config[server].setup({
        on_attach = on_attach,
        capabilities = capabilities
    })
end


-- Python
lsp_config.pyright.setup({
    on_attach = on_attach,
    capabilities = capabilities,

    on_init = function(client)
        if server == "pyright" then
            client.config.settings.python.pythonPath = get_python_path(client.config.root_dir)
        end
    end,
})

-- Vue
lsp_config.vuels.setup({
    on_attach = on_attach,
    capabilities = capabilities,

    init_options = {
        config = {
            vetur = {
                completion = {
                    autoImport = true,
                    tagCasing = "inital",
                    useScaffoldSnippets = true
                },
                useWorkspaceDependencies = true,
                validation = {
                    script = true,
                    style = true,
                    template = true,
                },
            }
        }
    }
})

-- Lua
lsp_config.lua_ls.setup({
    on_attach = on_attach,
    capabilities = capabilities,

    settings = {
        Lua = { diagnostics = { globals = { 'vim' }, }, },
        telemetry = { enable = false, },
    }
})

lsp_config.rust_analyzer.setup({
    on_attach = on_attach,
    capabilities = capabilities,
})

