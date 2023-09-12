local M = {}

local get_open_window_count = function()
  return vim.fn.winnr('$')
end

M.betterCloseAllButCurrent = function()
  vim.api.nvim_command('BufferCloseAllButCurrent')
  -- vim.fn.winnr returns the window number of the last window in the current tab
  -- This is same as the total number of the windows in the current tab.
  local open_window_count = get_open_window_count()
  if open_window_count > 1 then
    vim.api.nvim_input('<C-w>o')
  end
end

local get_listed_buffers = function()
  local all_bufs = vim.api.nvim_list_bufs()
  return vim.tbl_filter(function(buffer)
    return vim.fn.buflisted(buffer) == 1
  end, all_bufs)
end

local close_buffer_with_confirmation = function()
  local success, _ = pcall(vim.api.nvim_command, 'BufferClose')
  if success then
    return
  end
  local buf_name = vim.fn.expand('%:t')
  local msg = 'Save changes to "' .. buf_name .. '"'
  local choice = vim.fn.confirm(msg, '&Yes\n&No\n&Cancel', 1)
  if choice == 1 then
    vim.api.nvim_command('silent w')
    vim.api.nvim_command('BufferClose')
    return
  elseif choice == 2 then
    vim.api.nvim_command('BufferClose!')
    return
  end
end

M.betterBufferClose = function()
  close_buffer_with_confirmation()
  local listed_buffers_count = #get_listed_buffers()
  local open_window_count = get_open_window_count()
  if listed_buffers_count == 1 and open_window_count > 1 then
    vim.api.nvim_input('<C-w>o')
  end
end

M.printListedBuffers = function()
  local buf_list = vim.api.nvim_list_bufs()
  for _, bufnr in ipairs(buf_list) do
    if vim.fn.buflisted(bufnr) == 1 then
      local buf_name = vim.api.nvim_buf_get_name(bufnr)
      print(bufnr .. ' -> ' .. buf_name)
    end
  end
end

return M
