local utils = require('plugins.null-ls.utils')

local M = {}

M.initialize = function()
  vim.api.nvim_create_user_command('Format', utils.format, {
    desc = 'Formats the current buffer',
  })
end

return M
