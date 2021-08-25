local lspconfig = require('lspconfig')
local lspinstall = require('lspinstall')


local eslint = {
  lintCommand = 'npx eslint -f unix --stdin --stdin-filename ${INPUT}',
  lintIgnoreExitCode = true,
  lintStdin = true,
  lintFormats = { '%f:%l:%c: %m' },
  formatCommand = 'npx eslint --fix-to-stdout --stdin --stdin-filename=${INPUT}',
  formatStdin = true,
}

local prettier = {
  formatCommand = 'npx prettier --stdin-filepath ${INPUT}',
  formatStdin = true,
}

local stylua = { formatCommand = 'stylua -s -', formatStdin = true }

local format_config = {
  css = { prettier },
  html = { prettier },
  javascript = { prettier, eslint },
  javascriptreact = { prettier, eslint },
  json = { prettier },
  lua = { stylua },
  markdown = { prettier },
  scss = { prettier },
  typescript = { prettier, eslint },
  typescriptreact = { prettier, eslint },
  yaml = { prettier },
}

local on_attach = function(client, buffer_number)
  vim.opt.omnifunc = 'v:lua.vim.lsp.omnifunc'
  local opts = { noremap = true, silent = true }
  vim.api.nvim_buf_set_keymap(buffer_number, 'n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(buffer_number, 'n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  vim.api.nvim_buf_set_keymap(buffer_number, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  vim.api.nvim_buf_set_keymap(buffer_number, 'n', '<Leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  vim.api.nvim_buf_set_keymap(buffer_number, 'n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  vim.api.nvim_buf_set_keymap(buffer_number, 'n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  require('lsp_signature').on_attach()

  if client.name == 'typescript' then
    require('nvim-lsp-ts-utils').setup({})
  end
  -- So that the only client with format capabilities is efm
  if client.name ~= 'efm' then
    client.resolved_capabilities.document_formatting = false
  end

  if client.resolved_capabilities.document_formatting then
    vim.cmd([[
    augroup Format
    au! * <buffer>
    au BufWritePre <buffer> lua vim.lsp.buf.formatting_sync(nil, 1000)
    augroup END
    ]])
  end
end

local diagnostic_signs = {
  Error = '',
  Warning = '',
  Hint = '',
  Information = '',
}
for type, icon in pairs(diagnostic_signs) do
  local hl = 'LspDiagnosticsSign' .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = '' })
end

-- symbols for completion
vim.lsp.protocol.CompletionItemKind = {
  '   (Text) ',
  '   (Method)',
  '   (Function)',
  '   (Constructor)',
  ' ﴲ  (Field)',
  '[] (Variable)',
  '   (Class)',
  ' ﰮ  (Interface)',
  '   (Module)',
  ' 襁 (Property)',
  '   (Unit)',
  '   (Value)',
  ' 練 (Enum)',
  '   (Keyword)',
  '   (Snippet)',
  '   (Color)',
  '   (File)',
  '   (Reference)',
  '   (Folder)',
  '   (EnumMember)',
  ' ﲀ  (Constant)',
  ' ﳤ  (Struct)',
  '   (Event)',
  '   (Operator)',
  '   (TypeParameter)',
}

vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics,
  {
    virtual_text = true, -- Disables virtual text
    signs = true,
    update_in_insert = true,
  }
)

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = { 'documentation', 'detail', 'additionalTextEdits' },
}

local servers = {
  efm = {
    init_options = { documentFormatting = true, codeAction = true },
    root_dir = lspconfig.util.root_pattern({ '.git/', '.' }),
    filetypes = vim.tbl_keys(format_config),
    settings = { languages = format_config },
  },
  lua = {
    settings = {
      Lua = {
        diagnostics = { globals = { 'vim' } },
        completion = { keywordSnippet = 'Both' },
        runtime = {
          version = 'LuaJIT',
          path = vim.split(package.path, ';'),
        },
        workspace = {
          library = vim.list_extend(
            { [vim.fn.expand('$VIMRUNTIME/lua')] = true },
            {}
          ),
        },
      },
    },
  },
}

-- Setup servers
local function setup_servers()
  print('setup_servers')
  lspinstall.setup()
  local installed = lspinstall.installed_servers()
  for _, server in pairs(installed) do
    local config = servers[server]
      or { root_dir = lspconfig.util.root_pattern({ '.git/', '.' }) }
    config.capabilities = capabilities
    config.on_attach = on_attach
    lspconfig[server].setup(config)
  end
end

setup_servers()
