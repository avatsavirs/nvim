local tokyonight = require('tokyonight')

tokyonight.setup({
  style = "night",
  styles={
    comments = { italic = true },
    keywords = { italic = true },
    functions = { italic = true },
  },
  dim_inactive = true,
})

vim.cmd([[colorscheme tokyonight]])
