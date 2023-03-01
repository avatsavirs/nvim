local blankline = require('indent_blankline')

blankline.setup({
  char = '▏',
  space_char = ' ',
  -- use_treesitter = true,
  buftype_exclude = { 'nofile', 'help' },
})
