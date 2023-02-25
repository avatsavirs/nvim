local M = {}

M.initialize = function()
    vim.cmd([[
    command! BetterCloseAllButCurrent lua require('plugins.barbar.utils').betterCloseAllButCurrent()
    command! BetterBufferClose lua require('plugins.barbar.utils').betterBufferClose()
  ]])
end

return M
