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

-- This is a workaround for the issue where the LSP server returns multiple
-- definitions for a symbol. This function will pick the first definition
-- and jump to that location.
local function handle_go_to_definition(_, results)
  if not results or vim.tbl_isempty(results) then
    return;
  end
  return vim.lsp.util.jump_to_location(results[1], {});
end

M.setup_handlers = function(server_name)
  local opts = server_configs[server_name] or vim.empty_dict();
  opts.on_attach = handle_attach;
  opts.handlers = vim.tbl_extend(
    'keep',
    opts.handlers or {},
    {
      ["textDocument/definition"] = handle_go_to_definition,
      ["textDocument/publishDiagnostics"] = vim.lsp.with(
        vim.lsp.diagnostic.on_publish_diagnostics,
        {
          underline = true,
          virtual_text = false, -- Disables virtual text
          signs = true,
          update_in_insert = false,
        }
      ),
    }
  );
  nvim_lsp[server_name].setup(opts);
end

return M;
