local M = {};

M.KEY_MAPPINGS = {
  {
    mode = 'n',
    key_combination = 'gd',
    command = '<Cmd>lua vim.lsp.buf.definition()<CR>'
  },
  {
    mode = 'n',
    key_combination = 'K',
    command = '<Cmd>lua vim.lsp.buf.hover()<CR>'
  },
  {
    mode = 'n',
    key_combination = 'gi',
    command = '<cmd>lua vim.lsp.buf.implementation()<CR>'
  },
  {
    mode = 'n',
    key_combination = '<Leader>rn',
    command = '<cmd>lua vim.lsp.buf.rename()<CR>'
  },
  {
    mode = 'n',
    key_combination = '[d',
    command = '<cmd>lua vim.diagnostic.goto_prev()<CR>'
  },
  {
    mode = 'n',
    key_combination = ']d',
    command = '<cmd>lua vim.diagnostic.goto_next()<CR>'
  },
  {
    mode = 'n',
    key_combination = ']]',
    command = '<cmd>lua vim.diagnostic.open_float()<CR>'
  }
}

return M;
