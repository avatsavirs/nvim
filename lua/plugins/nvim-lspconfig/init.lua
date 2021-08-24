local nvim_lsp = require('lspconfig');


local servers = {
  'tsserver',
  'sumenko_lua',
  'jsonls',
  'cssls',
}

for _, server in ipairs(servers) do
  local server_config = require('plugins.nvim-lspconfig.' .. server);
  nvim_lsp[server_config.name].setup ({
    cmd = server_config.cmd,
    settings = server_config.settings,
    on_attach = function(_, buffer_number)
      local opts = { noremap = true, silent = true }
      vim.api.nvim_buf_set_keymap(buffer_number, 'n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
      vim.api.nvim_buf_set_keymap(buffer_number, 'n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
      vim.api.nvim_buf_set_keymap(buffer_number, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
      vim.api.nvim_buf_set_keymap(buffer_number, 'n', '<Leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
      vim.api.nvim_buf_set_keymap(buffer_number, 'n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
      vim.api.nvim_buf_set_keymap(buffer_number, 'n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
    end,
  });
end
