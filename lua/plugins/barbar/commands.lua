local M = {};

M.initialize = function ()
  vim.api.nvim_exec([[
    command! BetterCloseAllButCurrent lua require('plugins.barbar.utils').betterCloseAllButCurrent()
    command! BetterBufferClose lua require('plugins.barbar.utils').betterBufferClose()
  ]], true);
end

return M;
