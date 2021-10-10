local cmp = require('cmp');

-- Return true if cursor is at the start of the line
-- or immediately after a blank space
local check_back_space = function()
  local col = vim.fn.col('.') - 1;
  local current_line = vim.fn.getline('.');
  local character_before_cursor = current_line:sub(col, col);
  if col == 0 or character_before_cursor == ' ' then
    return true
  else
    return false
  end
end

-- If menu is visible:  goes to next item in the list
-- Else if menu is not visible and cursor is after a character: opens up the menu
-- else works as normal tab i.e. inserts space.
local function custom_tab_handler(fallback)
  if cmp.visible() then
    cmp.select_next_item();
  elseif check_back_space() then
    -- Fallback is normal Tab key behaviour i.e. insert space
    fallback();
  else
    local trigger_menu_open = cmp.mapping.complete();
    trigger_menu_open();
  end
end

return custom_tab_handler;
