local utils = require('plugins.barbar.utils')
local M = {}

M.initialize = function()
  vim.api.nvim_create_user_command('BetterCloseAllButCurrent', utils.betterCloseAllButCurrent, {
    desc = 'Closes all buffers except the current one',
  })
  vim.api.nvim_create_user_command('BetterBufferClose', utils.betterBufferClose, {
    desc = 'Closes the current buffer',
  })
  vim.api.nvim_create_user_command('ListBuffers', utils.printListedBuffers, {
    desc = 'Lists all listed buffers',
  })
end

return M
