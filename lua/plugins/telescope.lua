local map = require('utils').map;

map('n', '<C-p>', ':Telescope find_files<CR>');
map('n', '<C-g>', ':Telescope live_grep<CR>');
map('n', '<C-b><C-b>', ':Telescope buffers<CR>');

require('telescope').setup({
  defaults = {
    path_display = function (_, path)
      local path_len = string.len(path);
      if path_len > 80 then
        local turncated_path = string.sub(path, -80);
        return '...' .. turncated_path;
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
  }
});
