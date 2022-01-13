local M = {};

M.tsserver = require('plugins.nvim-lspconfig.server_configs.tsserver');
M.efm = require('plugins.nvim-lspconfig.server_configs.efm');
M.sumneko_lua = require('plugins.nvim-lspconfig.server_configs.sumneko_lua');

return M;
