local nvim_lsp = require('lspconfig');

local runtime_path = vim.split(package.path, ';');
table.insert(runtime_path, "lua/?.lua");
table.insert(runtime_path, "lua/?/init.lua");

local base_path = vim.fn.stdpath('config')..'/language-servers/lua-language-server';
local binary_path = base_path .. '/bin/Linux/lua-language-server';
local main_path = base_path ..'/main.lua';

local servers = {
  {
    name = 'tsserver',
  },
  {
    name = 'jsonls',
  },
  {
    name = 'sumneko_lua',
    cmd = {binary_path, "-E", main_path},
    settings = {
      Lua = {
        runtime = {
          version = 'LuaJIT',
          path = runtime_path,
        },
        diagnostics = {
          globals = {'vim'},
        },
        workspace = {
          library = vim.api.nvim_get_runtime_file("", true),
          checkThirdParty = false,
          maxPreload = 1500
        },
        telemetry = {
          enable = false,
        },
      },
    },
  },
  {
    name = 'cssls',
  }
}

for _, server in ipairs(servers) do
  nvim_lsp[server.name].setup ({
    cmd = server.cmd,
    settings = server.settings,
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
