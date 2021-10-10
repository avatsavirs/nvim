local nvim_lsp = require('lspconfig')
local lspinstall = require('lspinstall')
local on_attach = require('plugins.nvim-lspconfig.on_attach')
local server_configs = require('plugins.nvim-lspconfig.server_configs');

vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics,
  {
    underline = true,
    virtual_text = false, -- Disables virtual text
    signs = true,
    update_in_insert = false,
  }
)

local function getLspCapabilities()
  local capabilities = vim.lsp.protocol.make_client_capabilities();
  capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities);
  return capabilities;
end

-- Setup servers
local function setup_servers()
  lspinstall.setup();
  local installed_servers = lspinstall.installed_servers();
  for _, server in pairs(installed_servers) do
    local server_config = server_configs[server] or { root_dir = nvim_lsp.util.root_pattern({ '.git/', '.' }) };
    server_config.on_attach = on_attach;
    server_configs.capabilities = getLspCapabilities();
    nvim_lsp[server].setup(server_config);
  end
end

setup_servers()
