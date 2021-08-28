local diagnostic_signs = {
  Error = '',
  Warning = '',
  Hint = '',
  Information = '',
}

local setup = function ()
  for type, icon in pairs(diagnostic_signs) do
    local hl = 'LspDiagnosticsSign' .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = '' })
  end
end

local M = {};
M.setup = setup;
return M;
