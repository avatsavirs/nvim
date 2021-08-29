local replace_terminal_codes = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
  local col = vim.fn.col('.') - 1;
  if col == 0 or vim.fn.getline('.'):sub(col, col):match '%s' then
    return true
  else
    return false
  end
end

_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return replace_terminal_codes('<C-n>');
  elseif check_back_space() then
    return replace_terminal_codes('<Tab>');
  else
    return vim.fn['compe#complete']()
  end
end

_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return replace_terminal_codes('<C-p>');
  else
    return replace_terminal_codes('<S-Tab>');
  end
end

return function()
  -- Map tab to the above tab complete functiones
  vim.api.nvim_set_keymap('i', '<Tab>', 'v:lua.tab_complete()', { expr = true });
  vim.api.nvim_set_keymap('s', '<Tab>', 'v:lua.tab_complete()', { expr = true });
  vim.api.nvim_set_keymap('i', '<S-Tab>', 'v:lua.s_tab_complete()', { expr = true });
  vim.api.nvim_set_keymap('s', '<S-Tab>', 'v:lua.s_tab_complete()', { expr = true });

  -- Map compe confirm and complete functions
  -- vim.api.nvim_set_keymap('i', '<cr>', 'compe#confirm("<cr>")', { expr = true }); -- The insert mode <CR> keybinding is taken care of by nvim-autopairs
  vim.api.nvim_set_keymap('i', '<c-space>', 'compe#complete()', { expr = true });
end
