local map = require("utils").map;
local function initialize()
  map("n", "<C-b>", "<Nop>"); -- <C-b> will act as a leader key for all buffer operations
  map("n", "<C-b>h", ":BufferPrevious<CR>"); -- Move to previous buffer
  map("n", "<C-b>l", ":BufferNext<CR>"); -- Move to next buffer
  map("n", "<C-b>H", ":BufferMovePrevious<CR>"); -- Move current buffer back in the tabline
  map("n", "<C-b>L", ":BufferMoveNext<CR>"); -- Move current buffer forward in the tabline
  map("n", "<C-b>q", ":BufferClose<CR>"); -- Close buffer
  map("n", "<C-b>o", ":BetterCloseAllButCurrent<CR>"); -- Close all buffers except the current buffer
  map("n", "<C-b>1", ":BufferGoto 1<CR>"); -- Go to nth buffer
  map("n", "<C-b>2", ":BufferGoto 2<CR>");
  map("n", "<C-b>3", ":BufferGoto 3<CR>");
  map("n", "<C-b>4", ":BufferGoto 4<CR>");
  map("n", "<C-b>5", ":BufferGoto 5<CR>");
  map("n", "<C-b>6", ":BufferGoto 6<CR>");
  map("n", "<C-b>7", ":BufferGoto 7<CR>");
  map("n", "<C-b>8", ":BufferGoto 8<CR>");
  map("n", "<C-b>9", ":BufferGoto 9<CR>");
  map("n", "<C-b>0", ":BufferLast<CR>");
end

return {
  initialize = initialize
}
