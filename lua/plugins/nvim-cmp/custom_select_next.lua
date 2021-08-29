local cmp = require('cmp');

local check_back_space = function()
  local col = vim.fn.col('.') - 1;
  if col == 0 or vim.fn.getline('.'):sub(col, col):match '%s' then
    return true
  else
    return false
  end
end

local custom_select_next = function()
  if vim.fn.pumvisible() == 1 then
    vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<C-n>', true, true, true), 'n');
  elseif check_back_space() then
    vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Tab>', true, true, true), 'n');
  else
    local cmp_complete = cmp.mapping.complete();
    cmp_complete();
  end
end

return custom_select_next;
