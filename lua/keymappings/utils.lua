local M = {}

local function is_empty_startup_buffer(buffer_number)
  if not vim.api.nvim_buf_is_valid(buffer_number) then
    return false
  end

  if vim.api.nvim_get_option_value('modified', { buf = buffer_number }) then
    return false
  end

  if vim.api.nvim_get_option_value('buftype', { buf = buffer_number }) ~= '' then
    return false
  end

  if vim.api.nvim_buf_get_name(buffer_number) ~= '' then
    return false
  end

  local lines = vim.api.nvim_buf_get_lines(buffer_number, 0, 2, false)
  return #lines == 1 and lines[1] == ''
end

M.jumpBackWithStartupBufferCleanup = function()
  local startup_buffer = vim.api.nvim_get_current_buf()
  local should_cleanup_startup_buffer = is_empty_startup_buffer(startup_buffer)
  local ctrl_o = vim.api.nvim_replace_termcodes('<C-o>', true, false, true)
  vim.api.nvim_feedkeys(ctrl_o, 'nx', false)

  if should_cleanup_startup_buffer and startup_buffer ~= vim.api.nvim_get_current_buf()
      and vim.api.nvim_buf_is_valid(startup_buffer) and is_empty_startup_buffer(startup_buffer) then
    pcall(vim.api.nvim_buf_delete, startup_buffer, { force = false })
  end
end

return M
