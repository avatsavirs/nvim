local null_ls = require('null-ls')
local utils = require('plugins.null-ls.utils')
require('plugins.null-ls.commands').initialize()

null_ls.setup({
  sources = utils.get_sources(),
  on_attach = utils.on_attach,
})
