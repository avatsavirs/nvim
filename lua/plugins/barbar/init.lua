require('plugins.barbar.commands').initialize();
local CONSTANTS = require('plugins.barbar.constants');
local utils = require('utils');

for _, value in ipairs(CONSTANTS.KEY_MAPPINGS) do
  utils.map(value.mode, value.key_combination, value.command);
end

vim.g.bufferline = {
  animation = false,
  auto_hide = false,
  clickable = false,
  closable = false,
  icon_custom_colors = false,
  icon_separator_active = "▎",
  icon_separator_inactive = "▎",
  icons = true,
  letters = "asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP",
  maximum_length = 50,
  maximum_padding = 4,
  no_name_title = vim.NIL,
  semantic_letters = true,
  tabpages = true
}
