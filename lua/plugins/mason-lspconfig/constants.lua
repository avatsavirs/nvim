local M = {}

M.LSP_KEY_MAPPINGS = {
  {
    mode = 'n',
    key_combination = 'gd',
    command = '<Cmd>lua vim.lsp.buf.definition()<CR>',
  },
  {
    mode = 'n',
    key_combination = 'gD',
    command = '<Cmd>lua vim.lsp.buf.declaration()<CR>',
  },
  {
    mode = 'n',
    key_combination = 'K',
    command = '<Cmd>lua vim.lsp.buf.hover()<CR>',
  },
  {
    mode = 'n',
    key_combination = 'gi',
    command = '<cmd>lua vim.lsp.buf.implementation()<CR>',
  },
  {
    mode = 'n',
    key_combination = '<Leader>rn',
    command = '<cmd>lua vim.lsp.buf.rename()<CR>',
  },
  {
    mode = 'n',
    key_combination = '[d',
    command = '<cmd>lua vim.diagnostic.goto_prev()<CR>',
  },
  {
    mode = 'n',
    key_combination = ']d',
    command = '<cmd>lua vim.diagnostic.goto_next()<CR>',
  },
  {
    mode = 'n',
    key_combination = ']]',
    command = '<cmd>lua vim.diagnostic.open_float()<CR>',
  },
}

-- NOTE: run lua print(vim.inspect(vim.diagnostic.severity))
-- to get the severity levels
M.DIAGNOSTICS_SIGNS = {
  {
    type = 'Error',
    icon = '',
  },
  {
    type = 'Warn',
    icon = '',
  },
  {
    type = 'Hint',
    icon = '',
  },
  {
    type = 'Info',
    icon = '',
  },
}

M.MASON_PACKAGES_SIGNS = {
  package_installed = '✓',
  package_pending = '➜',
  package_uninstalled = '✗',
}

M.MASON_KEY_MAPPINGS = {
  uninstall_package = 'dd',
}

M.LANGUAGE_SERVERS_LIST = {
  'lua_ls',
  'rust_analyzer',
  'tsserver',
  'gopls',
  'graphql',
  'html',
  'pyright',
  'solc',
  'yamlls',
  'clangd',
}

return M
