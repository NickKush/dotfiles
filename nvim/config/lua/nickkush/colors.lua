-- vim.g.gruvbox_invert_selection = "0"  -- Better selection color https://github.com/morhetz/gruvbox/issues/15

-- local cs = "gruvbox"

local cs = "catppuccin-mocha"

local success, _ = pcall(vim.cmd, "colorscheme " .. cs)
if not success then
    -- vim.notify("Color scheme " .. colorscheme .. " not found")
    return
end

