local map = require("utils").map;

map("n", "<C-b>", "<Nop>");
map("n", "<C-b>h", ":BufferPrevious<CR>", {silent = true});
map("n", "<C-b>l", ":BufferNext<CR>", {silent = true});
map("n", "<C-b>H", ":BufferMovePrevious<CR>", {silent = true});
map("n", "<C-b>L", ":BufferMoveNext<CR>", {silent = true});
map("n", "<C-b>q", ":BufferClose<CR>", {silent = true});
map("n", "<C-b>o", ":BufferCloseAllButCurrent<CR>", {silent = true});
map("n", "<C-b>1", ":BufferGoto 1<CR>", {silent = true});
map("n", "<C-b>2", ":BufferGoto 2<CR>", {silent = true});
map("n", "<C-b>3", ":BufferGoto 3<CR>", {silent = true});
map("n", "<C-b>4", ":BufferGoto 4<CR>", {silent = true});
map("n", "<C-b>5", ":BufferGoto 5<CR>", {silent = true});
map("n", "<C-b>6", ":BufferGoto 6<CR>", {silent = true});
map("n", "<C-b>7", ":BufferGoto 7<CR>", {silent = true});
map("n", "<C-b>8", ":BufferGoto 8<CR>", {silent = true});
map("n", "<C-b>9", ":BufferGoto 9<CR>", {silent = true});
map("n", "<C-b>0", ":BufferLast<CR>", {silent = true});
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
