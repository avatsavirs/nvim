local nvim_lsp       = require('lspconfig')
local utils          = require('utils');
local CONSTANTS      = require('plugins.nvim-lspconfig.constants');
local server_configs = require('plugins.nvim-lspconfig.server_configs');

local M              = {};

local function set_lsp_keybindings(buffer_number)
  for _, value in ipairs(CONSTANTS.LSP_KEY_MAPPINGS) do
    utils.map_in_buffer(buffer_number, value.mode, value.key_combination, value.command);
  end
end

local function set_diagnostic_symbols()
  for _, diagnostics_sign in pairs(CONSTANTS.DIAGNOSTICS_SIGNS) do
    local signName = 'DiagnosticSign' .. diagnostics_sign.type
    vim.fn.sign_define(signName,
      {
        text = diagnostics_sign.icon,
        texthl = signName, -- highlight group name is the same as the sign name
        numhl = ''
      })
  end
end

local function handle_attach(_, buffer_number)
  set_lsp_keybindings(buffer_number);
  set_diagnostic_symbols();
end

M.setup_handlers = function(server_name)
  local opts = server_configs[server_name] or vim.empty_dict();
  opts.on_attach = handle_attach;
  nvim_lsp[server_name].setup(opts);
end

return M;
