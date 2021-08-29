local map = require('utils').map;
map('i', '<C-h>', '<BS>', {noremap = false}); -- <C-h> should act like backspace.
require("nvim-autopairs.completion.cmp").setup({
  map_cr = true,
});
require('nvim-autopairs').setup();
