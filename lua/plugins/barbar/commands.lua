local M = {}

M.initialize = function()
  vim.cmd([[
    command! BetterCloseAllButCurrent lua require('plugins.barbar.utils').betterCloseAllButCurrent()
    command! BetterBufferClose lua require('plugins.barbar.utils').betterBufferClose()
    command! ListBuffers lua require('plugins.barbar.utils').listBuffers()
  ]])
end

return M
