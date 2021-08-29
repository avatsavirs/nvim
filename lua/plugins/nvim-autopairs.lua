local map = require('utils').map;
map('i', '<C-h>', '<BS>', {noremap = false}); -- <C-h> should act like backspace.
require("nvim-autopairs.completion.compe").setup({
  map_cr = true,
});
require('nvim-autopairs').setup();
