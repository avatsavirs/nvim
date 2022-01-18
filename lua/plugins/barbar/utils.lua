local M = {};

M.betterCloseAllButCurrent = function ()
  if(vim.fn.winnr('$') > 1) then
    vim.api.nvim_input("<C-w>o");
  end
  vim.api.nvim_command("BufferCloseAllButCurrent");
end

local get_listed_buffers = function ()
  local all_bufs = vim.api.nvim_list_bufs();
  local listed_buffers = {};
  for _,value in ipairs(all_bufs) do
    if(vim.fn.buflisted(value) == 1) then
      table.insert(listed_buffers, value)
    end
  end;
  return listed_buffers;
end

M.betterBufferClose = function ()
  vim.api.nvim_command("BufferClose");
  if(#get_listed_buffers() == 1) then
    vim.api.nvim_input("<C-w>o");
  end
end

return M;
