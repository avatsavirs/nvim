local mason = require('mason')
local mason_lspconfig = require('mason-lspconfig')
local utils = require('plugins.mason-lspconfig.utils')
local CONSTANTS = require('plugins.mason-lspconfig.constants')

mason.setup({
  ui = {
    icons = CONSTANTS.MASON_PACKAGES_SIGNS,
  },
  keymaps = CONSTANTS.MASON_KEY_MAPPINGS,
})

mason_lspconfig.setup({
  ensure_installed = CONSTANTS.LANGUAGE_SERVERS_LIST,
  automatic_installation = true,
})

mason_lspconfig.setup_handlers({
  utils.setup_handlers,
})

vim.diagnostic.config({
  underline = false,
  signs = true,
  update_in_insert = false,
  virtual_text = false,
  float = {
    source = false,
    border = 'rounded',
    format = function(_diagnostic)
      return string.format('%s(%s):\n%s\n', _diagnostic.source, _diagnostic.code, _diagnostic.message)
    end,
    suffix = '',
  },
  severity_sort = true,
})
