require("config.keymaps_lazyvim")

local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  local modes = type(mode) == "string" and { mode } or mode

  ---@param m string
  modes = vim.tbl_filter(function(m)
    return not (keys.have and keys:have(lhs, m))
  end, modes)

  -- do not create the keymap if a lazy keys handler exists
  if #modes > 0 then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    if opts.remap and not vim.g.vscode then
      ---@diagnostic disable-next-line: no-unknown
      opts.remap = nil
    end
    vim.keymap.set(modes, lhs, rhs, opts)
  end
end

-- bufferline picker
map("n", "<space>t", "<Cmd>BufferLinePick<CR>", { desc = "Buffer picker" })

-- search in current file
map("n", "<leader>sf", function()
  local file_path = vim.fn.expand("%:p")
  Snacks.picker.grep({
    transform = function(item)
      local item_path = vim.fn.fnamemodify(item.cwd .. "/" .. item.file, ":p")
      return item_path == file_path
    end,
  })
end, { desc = "Search in current file" })
