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
  if #get_listed_buffers() == 1 then
    vim.api.nvim_input('<C-w>o')
  end
end

M.listBuffers = function ()
  -- Table to hold the list of currently opened buffers
  local open_buffers = {}

  -- Iterate over all tab pages
  for _, tabnr in ipairs(vim.api.nvim_list_tabpages()) do
    -- Iterate over all windows in the current tab page
    for _, winnr in ipairs(vim.api.nvim_tabpage_list_wins(tabnr)) do
      -- Get the buffer associated with the current window
      local bufnr = vim.api.nvim_win_get_buf(winnr)
      -- Get the buffer name
      local buf_name = vim.api.nvim_buf_get_name(bufnr)
      -- Store the buffer number and name in the table
      open_buffers[bufnr] = buf_name
    end
  end

  -- Print the list of currently opened buffers
  for bufnr, buf_name in pairs(open_buffers) do
    print("Buffer number: " .. bufnr .. ", Buffer name: " .. buf_name)
  end
end


return M
