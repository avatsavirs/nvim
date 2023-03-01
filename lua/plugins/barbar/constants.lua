local M = {}

M.KEY_MAPPINGS = {
  { -- <C-b> will act as a leader key for all buffer operations
    mode = 'n',
    key_combination = '<C-b>',
    command = '<Nop>',
  },
  { -- Move to previous buffer
    mode = 'n',
    key_combination = '<C-b>h',
    command = ':BufferPrevious<CR>',
  },
  { -- Move to next buffer
    mode = 'n',
    key_combination = '<C-b>l',
    command = ':BufferNext<CR>',
  },
  { -- Move current buffer back in the tabline
    mode = 'n',
    key_combination = '<C-b>H',
    command = ':BufferMovePrevious<CR>',
  },
  { -- Move current buffer forward in the tabline
    mode = 'n',
    key_combination = '<C-b>L',
    command = ':BufferMoveNext<CR>',
  },
  { -- Close buffer
    mode = 'n',
    key_combination = '<C-b>q',
    command = ':BetterBufferClose<CR>',
  },
  { -- Close all buffers except the current buffer
    mode = 'n',
    key_combination = '<C-b>o',
    command = ':BetterCloseAllButCurrent<CR>',
  },
  { -- Go to nth buffer
    mode = 'n',
    key_combination = '<C-b>1',
    command = ':BufferGoto 1<CR>',
  },
  {
    mode = 'n',
    key_combination = '<C-b>2',
    command = ':BufferGoto 2<CR>',
  },
  {
    mode = 'n',
    key_combination = '<C-b>3',
    command = ':BufferGoto 3<CR>',
  },
  {
    mode = 'n',
    key_combination = '<C-b>4',
    command = ':BufferGoto 4<CR>',
  },
  {
    mode = 'n',
    key_combination = '<C-b>5',
    command = ':BufferGoto 5<CR>',
  },
  {
    mode = 'n',
    key_combination = '<C-b>6',
    command = ':BufferGoto 6<CR>',
  },
  {
    mode = 'n',
    key_combination = '<C-b>7',
    command = ':BufferGoto 7<CR>',
  },
  {
    mode = 'n',
    key_combination = '<C-b>8',
    command = ':BufferGoto 8<CR>',
  },
  {
    mode = 'n',
    key_combination = '<C-b>9',
    command = ':BufferGoto 9<CR>',
  },
  {
    mode = 'n',
    key_combination = '<C-b>0',
    command = ':BufferLast<CR>',
  },
}

return M
