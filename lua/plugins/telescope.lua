local map = require('utils').map;

map('n', '<C-p>', ':Telescope find_files preview=true<CR>'); -- file search
map('n', '<C-g>', ':Telescope live_grep preview=true<CR>'); -- project wide grep
map('n', '<C-b><C-b>', ':Telescope buffers preview=true<CR>'); -- buffer search

require('telescope').setup({
  defaults = {
    sorting_strategy="ascending", -- Best match is at top
    layout_strategy = 'vertical', -- Vertical layout for telescope window
    layout_config = {
      vertical = {
        height = 0.9,
        width = 0.98,
      }
    },
    -- Disable file preview in setting and pass preview=true as an option with Telescope command
    preview=false,
    -- Turncate filepath if out of bounds
    -- TODO: Get width of telescope window dynamically
    path_display = function (_, path)
      local path_len = string.len(path);
      if path_len > 180 then
        local turncated_path = string.sub(path, -180);
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
