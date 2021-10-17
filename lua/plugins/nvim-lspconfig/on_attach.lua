local format_on_save = function (server)
  -- So that the only client with format capabilities is efm
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

local set_lsp_keybindings = function (_, buffer_number)
  local opts = { noremap = true, silent = true }
  vim.api.nvim_buf_set_keymap(buffer_number, 'n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(buffer_number, 'n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  vim.api.nvim_buf_set_keymap(buffer_number, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  vim.api.nvim_buf_set_keymap(buffer_number, 'n', '<Leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  vim.api.nvim_buf_set_keymap(buffer_number, 'n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  vim.api.nvim_buf_set_keymap(buffer_number, 'n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  vim.api.nvim_buf_set_keymap(buffer_number, 'n', ']]', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
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

local on_attach = function(...)
  set_lsp_keybindings(...);
  set_diagnostic_symbols();
  format_on_save(...);
end

return on_attach;
