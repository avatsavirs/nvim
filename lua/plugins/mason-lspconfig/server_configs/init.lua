local M = {}

M.ts_ls = require('plugins.mason-lspconfig.server_configs.tsserver')
M.lua_ls = require('plugins.mason-lspconfig.server_configs.lua_ls')
M.eslint = require('plugins.mason-lspconfig.server_configs.eslint')

return M
