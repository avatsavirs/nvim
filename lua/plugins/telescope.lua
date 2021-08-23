local map = require('utils').map;

map('n', '<C-p>', ':Telescope find_files<CR>'); -- file search
map('n', '<C-g>', ':Telescope live_grep<CR>'); -- project wide grep
map('n', '<C-b><C-b>', ':Telescope buffers<CR>'); -- buffer search
-- TODO: add keymappings for resetting files in git status mode
map('n', '<Leader>gs', ':Telescope git_status<CR>'); -- git status
map('n', '<Leader>gc', ':Telescope git_commits<CR>'); -- git commits
map('n', '<Leader>gb', ':Telescope git_branches<CR>'); -- git branches
map('n', '<Leader>gt', ':Telescope git_stash<CR>'); -- git stash
--[[
  Use telescope file_browser instead of nvim tree in future
  Needs more configuration:
    * g browser
    * Use relative path from root instead of absolute paths
    * Add commands for common opeartions like create, delete, rename, copy, move etc.
  map('n', '<C-f>', ':Telescope file_browser<CR>');
]]

require('telescope').setup({
  defaults = {
    -- Turncate filepath if out of bound
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
    -- Show selected file name on top of file preview window
    dynamic_preview_title = true,
    -- Vertical layout for telescope window
    layout_strategy = 'vertical',
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
    git_branches = {
      previewer = false
    },
    git_status = {
      mappings = {
        i = {
          ['<C-s>'] = 'git_staging_toggle',
          ['<C-r>s'] = 'git_reset_soft',
          ['<C-r>m'] = 'git_reset_mixed',
          ['<C-r>h'] = 'git_reset_hard',
        },
        n = {
          ['<C-s>'] = 'git_staging_toggle',
          ['<C-r>s'] = 'git_reset_soft',
          ['<C-r>m'] = 'git_reset_mixed',
          ['<C-r>h'] = 'git_reset_hard',
        }
      }
    }
  }
});
