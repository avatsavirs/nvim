local runtime_path = vim.split(package.path, ';');
table.insert(runtime_path, "lua/?.lua");
table.insert(runtime_path, "lua/?/init.lua");

local base_path = vim.fn.stdpath('config')..'/language-servers/lua-language-server';
local binary_path = base_path .. '/bin/Linux/lua-language-server';
local main_path = base_path ..'/main.lua';

return {
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
}
