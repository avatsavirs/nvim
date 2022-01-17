require('plugins.barbar.keymappings').initialize();
require('plugins.barbar.commands').initialize();

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
