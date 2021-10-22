-- source: https://github.com/hrsh7th/nvim-cmp/wiki/Example-mappings#luasnip
local cmp = require('cmp');
local luasnip = require("luasnip");

local has_words_before = function()
  local line_no, col_no = unpack(vim.api.nvim_win_get_cursor(0))
  local line_text = vim.api.nvim_buf_get_lines(0, line_no - 1, line_no, true)[1];
  local char_before_cursor = line_text:sub(col_no, col_no);
  return col_no ~= 0 and char_before_cursor:match("%s") == nil
end

local function custom_tab_handler(fallback)
  if cmp.visible() then
    cmp.select_next_item();
  elseif luasnip.expand_or_jumpable() then
    luasnip.expand_or_jump();
  elseif has_words_before() then
    cmp.complete();
  else
    -- Fallback is normal Tab key behaviour i.e. insert Tab space
    fallback();
  end
end

return custom_tab_handler;
