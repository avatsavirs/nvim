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
})
