return {
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      options = {
        globalstatus = true,
        icons_enabled = false,
        -- theme = 'gruvbox',
        -- theme = 'catppuccin-mocha',
        theme = 'auto',
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        always_divide_middle = true
      },

      sections = {
        lualine_a = {'mode'},
        lualine_b = { { 'filename', path=1 } },
        lualine_c = {'diagnostics'},
        lualine_x = {'encoding', 'branch'},
        lualine_y = {'filetype' }, --, 'g:metals_status'},
        lualine_z = {'progress', 'location'}
      }
    }
  }
}
