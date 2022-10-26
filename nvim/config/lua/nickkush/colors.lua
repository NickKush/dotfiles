vim.g.gruvbox_invert_selection = "0"  -- Better selection color https://github.com/morhetz/gruvbox/issues/15

local colorscheme = "gruvbox"

local success, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not success then
    -- vim.notify("Color scheme " .. colorscheme .. " not found")
    return
end

