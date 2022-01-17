local utils = require('utils');

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
  utils.map_in_buffer(buffer_number, 'n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>')
  utils.map_in_buffer(buffer_number, 'n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>')
  utils.map_in_buffer(buffer_number, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
  utils.map_in_buffer(buffer_number, 'n', '<Leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>')
  utils.map_in_buffer(buffer_number, 'n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>')
  utils.map_in_buffer(buffer_number, 'n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>')
  utils.map_in_buffer(buffer_number, 'n', ']]', '<cmd>lua vim.diagnostic.open_float()<CR>')
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
