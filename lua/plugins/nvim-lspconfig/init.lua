local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")
local utils = require('plugins.nvim-lspconfig.utils')
local CONSTANTS = require('plugins.nvim-lspconfig.constants')

mason.setup({
  ui = {
    icons = CONSTANTS.MASON_PACKAGES_SIGNS
  },
  keymaps = CONSTANTS.MASON_KEY_MAPPINGS
});

mason_lspconfig.setup({
  ensure_installed = CONSTANTS.LANGUAGE_SERVERS_LIST,
  automatic_installation = true,
});

mason_lspconfig.setup_handlers({
  utils.setup_handlers
})
