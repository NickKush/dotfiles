local success, lualine = pcall(require, 'lualine')

if not success then
    return
end

lualine.setup {
    options = {
        globalstatus = true,
        icons_enabled = false,
        -- theme = 'gruvbox',
        theme = 'catppuccin-mocha',
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        always_divide_middle = true
    },

    sections = {
        lualine_a = {'mode'},
        lualine_b = { { 'filename', path=0 } },
        lualine_c = {'diagnostics'},
        lualine_x = {'encoding', 'branch'},
        lualine_y = {'filetype' }, --, 'g:metals_status'},
        lualine_z = {'progress', 'location'}
    }
}
