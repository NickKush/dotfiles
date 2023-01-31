local success, lualine = pcall(require, 'lualine')

if not success then
    return
end

lualine.setup {
    options = {
        globalstatus = true,
        icons_enabled = false,
        theme = 'gruvbox',
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        always_divide_middle = true
    },

    sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diagnostics'},
        lualine_c = { { 'filename', path=1 } },
        lualine_x = {'diff', 'encoding',},
        lualine_y = {'filetype', 'g:metals_status'},
        lualine_z = {'progress', 'location'}
    }
}
