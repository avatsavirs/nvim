local M = {};

M.betterCloseAllButCurrent = function ()
  if(vim.fn.winnr('$') > 1) then
    vim.api.nvim_exec([[
      execute "norm \<C-w>o"
    ]], true);
  end
  vim.api.nvim_exec([[
    execute "BufferCloseAllButCurrent"
  ]], true);
end

local get_number_of_listed_buffers = function ()
  local count = 0;
  for buffer = 1, vim.fn.bufnr('$') do
    local is_listed = vim.fn.buflisted(buffer) == 1;
    if is_listed then
      count = count + 1;
    end
  end
  return count;
end

M.betterBufferClose = function ()
  vim.api.nvim_exec([[
    execute "BufferClose"
  ]], true);
  if(get_number_of_listed_buffers() == 1) then
    vim.api.nvim_exec([[
      execute "norm \<C-w>o"
    ]], true);
  end
end

return M;
