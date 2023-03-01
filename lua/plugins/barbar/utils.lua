local M = {}

M.betterCloseAllButCurrent = function()
  if vim.fn.winnr('$') > 1 then
    vim.api.nvim_input('<C-w>o')
  end
  vim.api.nvim_command('BufferCloseAllButCurrent')
end

local get_listed_buffers = function()
  local all_bufs = vim.api.nvim_list_bufs()
  return vim.tbl_filter(function(buffer)
    return vim.fn.buflisted(buffer) == 1
  end, all_bufs)
end

M.betterBufferClose = function()
  vim.api.nvim_command('BufferClose')
  if #get_listed_buffers() == 1 then
    vim.api.nvim_input('<C-w>o')
  end
end

return M
