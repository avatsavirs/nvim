local nvim_lsp = require('lspconfig')
local lspinstall = require('lspinstall')

local on_attach = function(client, buffer_number)
  vim.opt.omnifunc = 'v:lua.vim.lsp.omnifunc'

  require('plugins.nvim-lspconfig.lsp_keymappings').setup(buffer_number);
  require('plugins.nvim-lspconfig.lsp_diagnostic_symbols_config').setup();
  require('plugins.nvim-lspconfig.auto_formatting').setup(client);

  -- TODO: check if this plugin is required.
  --[[ if client.name == 'typescript' then
    require('nvim-lsp-ts-utils').setup({});
  end ]]
end

vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics,
  {
    underline = true,
    virtual_text = false, -- Disables virtual text
    signs = true,
    update_in_insert = false,
  }
)

local format_config = require('plugins.nvim-lspconfig.format_config');
local server_configs = {
  typescript = {
    handlers = {
      ['textDocument/publishDiagnostics'] = function() end -- Disable diagnostics messages for typescript errors so only emf errors are shown
    }
  },
  efm = {
    init_options = { documentFormatting = true, codeAction = true },
    root_dir = nvim_lsp.util.root_pattern({ '.git/' }),
    filetypes = vim.tbl_keys(format_config),
    settings = { languages = format_config },
  },
  lua = {
    settings = {
      Lua = {
        diagnostics = { globals = { 'vim' } },
        runtime = {
          version = 'LuaJIT',
          path = vim.split(package.path, ';'),
        },
        workspace = {
          library = vim.api.nvim_get_runtime_file("", true)
        },
      },
    },
  },
}

-- This is copied from another config. Idk what it does.
local capabilities = vim.lsp.protocol.make_client_capabilities();
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = { 'documentation', 'detail', 'additionalTextEdits' },
}

-- Setup servers
local function setup_servers()
  lspinstall.setup();
  local installed_servers = lspinstall.installed_servers();
  for _, server in pairs(installed_servers) do
    local server_config = server_configs[server] or { root_dir = nvim_lsp.util.root_pattern({ '.git/', '.' }) };
    server_config.capabilities = capabilities;
    server_config.on_attach = on_attach;
    nvim_lsp[server].setup(server_config);
  end
end

setup_servers()
