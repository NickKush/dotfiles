local success, nvim_tree = pcall(require, 'nvim-tree')
if not success then 
    return
end

-- Set folder color 
vim.cmd("highlight NvimTreeFolderName guifg=lightgray") 
vim.cmd("highlight NvimTreeOpenedFolderName guifg=darkgray") 
vim.cmd("highlight NvimTreeEmptyFolderName guifg=gray") 

nvim_tree.setup {
    renderer = {
        highlight_git = true,
        highlight_opened_files = "name",
        indent_markers = {
            enable = false,
            icons = {
                corner = "└ ",
                edge = "│ ",
                none = "  ",
            }
        },

        icons = {
            webdev_colors = true,
            show = {
                git = false
            },
        }
    },

    view = {
        side = "left",
        number = true,
        relativenumber = true,
        signcolumn = "no"
    }
}

