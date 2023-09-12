local M = {}

M.initialize = function()
  vim.cmd([[
    command! Format lua require('plugins.null-ls.utils').format()
  ]])
end

return M
