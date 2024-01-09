local CONSTANTS = require('plugins.nvim-treesitter.constants')

require('nvim-treesitter.configs').setup({
  ensure_installed = CONSTANTS.PARSER_INSTALL_LIST, -- checks and install all parsers in list
  sync_install = false, -- parsers listed in ensure_installed are installed asynchronously
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = true,
  },
  indent = {
    enable = true,
  },
  incremental_selection = {
    enable = true,
  },
  autotag = {
    enable = true,
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ['af'] = { query = '@function.outer', desc = 'Select outer part of a function region' },
        ['if'] = { query = '@function.inner', desc = 'Select inner part of a function region' },
        ['ac'] = { query = '@class.outer', desc = 'Select outer part of a class region' },
        ['ic'] = { query = '@class.inner', desc = 'Select inner part of a class region' },
      },
    },
    move = {
      enable = true,
      set_jumps = true,
      goto_previous_start = {
        ['[f'] = { query = '@function.outer', desc = 'Go to previous function start' },
        ['[c'] = { query = '@class.outer', desc = 'Go to previous class start' },
      },
      goto_next_end = {
        [']f'] = { query = '@function.outer', desc = 'Go to next function end' },
        [']c'] = { query = '@class.outer', desc = 'Go to next class end' }, -- go to end of the current class
      },
    },
  },
})
