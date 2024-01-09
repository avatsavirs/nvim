local utils = require('keymappings.utils')

local M = {}

M.initialize = function ()
  vim.api.nvim_create_user_command('OpenLastFile', utils.openLastFile, {
    desc = 'Open last file',
  })
end

return M
