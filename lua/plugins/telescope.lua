local map = require('utils').map;

map('n', '<C-p>', ':Telescope find_files<CR>');
map('n', '<C-g>', ':Telescope live_grep<CR>');
map('n', '<C-b><C-b>', ':Telescope buffers<CR>');

require('telescope').setup({
  defaults = {
    path_display = {'tail'},
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
