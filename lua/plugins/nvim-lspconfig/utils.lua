local utils = require('utils');
local CONSTANTS  = require('plugins.nvim-lspconfig.constants');

local M = {};

local format_on_save = function (server)
  -- So that the only server with format capabilities is efm
  if server.name ~= 'efm' then
    server.resolved_capabilities.document_formatting = false
  end

  if server.resolved_capabilities.document_formatting then
    vim.cmd([[
      augroup Format
        au! * <buffer>
        au BufWritePre <buffer> lua vim.lsp.buf.formatting_sync({}, 1000)
      augroup END
    ]])
  end
end

local set_lsp_keybindings = function (buffer_number)
  for _, value in ipairs(CONSTANTS.KEY_MAPPINGS) do
    utils.map_in_buffer(buffer_number, value.mode, value.key_combination, value.command);
  end
end

local set_diagnostic_symbols = function ()
  local diagnostic_signs = {
    Error = '',
    Warning = '',
    Hint = '',
    Information = '',
  }
  for type, icon in pairs(diagnostic_signs) do
    local hl = 'LspDiagnosticsSign' .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = '' })
  end
end

M.handle_attach = function(server, buffer_number)
  set_lsp_keybindings(buffer_number);
  set_diagnostic_symbols();
  format_on_save(server);
end

return M;
