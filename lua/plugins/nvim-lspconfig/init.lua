local nvim_lsp = require('lspconfig')
local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")
local utils = require('plugins.nvim-lspconfig.utils')
local server_configs = require('plugins.nvim-lspconfig.server_configs');

--[[ vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics,
  {
    underline = true,
    virtual_text = false, -- Disables virtual text
    signs = true,
    update_in_insert = false,
  }
)
 ]]
mason.setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    }
  },
  keymaps = {
    uninstall_package = "dd",
  }
});

mason_lspconfig.setup({
  ensure_installed = {
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
  },
  automatic_installation = true,
});

mason_lspconfig.setup_handlers({
  function(server_name)
    local opts = server_configs[server_name] or {};
    opts.on_attach = utils.handle_attach;
    nvim_lsp[server_name].setup(opts);
  end
})
