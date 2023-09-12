local M = {}

M.betterCloseAllButCurrent = function()
  vim.api.nvim_command('BufferCloseAllButCurrent')
  -- vim.fn.winnr returns the window number of the last window in the current tab
  -- This is same as the total number of the windows in the current tab.
  if vim.fn.winnr('$') > 1 then
    vim.api.nvim_input('<C-w>o')
  end
end

local get_listed_buffers = function()
  local all_bufs = vim.api.nvim_list_bufs()
  return vim.tbl_filter(function(buffer)
    return vim.fn.buflisted(buffer) == 1
  end, all_bufs)
end

M.betterBufferClose = function()
  vim.api.nvim_command('BufferClose')
  local listed_buffers_count = #get_listed_buffers()
  if listed_buffers_count == 1 then
    vim.api.nvim_input('<C-w>o')
  end
end

M.printListedBuffers = function ()
  local buf_list = vim.api.nvim_list_bufs()
  for _, bufnr in ipairs(buf_list) do
    if vim.fn.buflisted(bufnr) == 1 then
      local buf_name = vim.api.nvim_buf_get_name(bufnr)
      print(bufnr .. " -> " .. buf_name)
    end
  end
end

return M
