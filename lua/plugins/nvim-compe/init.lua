local set_option = require('utils').set_option;
local compe = require('compe');
local set_completion_symbols = require('plugins.nvim-compe.set_completion_symbols');
local set_completion_keymappings = require('plugins.nvim-compe.set_completion_keymappings');

set_option('completeopt', 'menuone,noselect');

compe.setup({
  preselect = 'always', -- Preselect the first option
  source = { -- Sources for completion suggestions
    nvim_lsp = true,
    nvim_lua = {
      filetypes = {'lua'}
    },
    path = true,
    buffer = true,
    calc = false,
    tags = false,
    spell = false,
    omni = false,
    emoji = false,
    treesitter = false,
  }
});

set_completion_symbols();
set_completion_keymappings();
