local map = require('utils').map;

map('n', '<C-p>', ':Telescope find_files<CR>'); -- file search
map('n', '<C-g>', ':Telescope live_grep<CR>'); -- project wide grep
map('n', '<C-b><C-b>', ':Telescope buffers<CR>'); -- buffer search
--[[
  Plan to use telescope file_browser instead of nvim tree in future
  See: Telescope file_browser
  Needs more configuration:
    * Use relative path from root instead of absolute paths
    * Add commands for common opeartions like create, delete, rename, copy, move etc.
]]

require('telescope').setup({
  defaults = {
    -- Turncate filepath if out of bounds
    -- TODO: Get width of telescope window dynamically
    path_display = function (_, path)
      local path_len = string.len(path);
      if path_len > 163 then
        local turncated_path = string.sub(path, -163);
        return '…' .. turncated_path;
      else
        return path;
      end
    end,
    prompt_prefix = "  ",
    selection_caret = " ",
    mappings = {
      i = {
        ["<C-j>"] = 'move_selection_next',
        ["<C-k>"] = 'move_selection_previous',
      },
      n = {
        ["<C-c>"] = 'close',
      },
    },
    dynamic_preview_title = true, -- Show selected file name on top of file preview window
    layout_strategy = 'vertical', -- Vertical layout for telescope window
  },
  pickers = {
    buffers = {
      mappings = {
        i = {
          ['<C-d>'] = 'delete_buffer'
        },
        n = {
          ['<C-d>'] = 'delete_buffer'
        }
      }
    },
  }
});
