local utils = require('utils')
local CONSTANTS = require('plugins.mason-lspconfig.constants')
local server_configs = require('plugins.mason-lspconfig.server_configs')

local M = {}

local cmp_capabilities = {}
local has_cmp_lsp, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
if has_cmp_lsp then
  cmp_capabilities = cmp_nvim_lsp.default_capabilities()
end

local function set_lsp_keybindings(buffer_number)
  for _, value in ipairs(CONSTANTS.LSP_KEY_MAPPINGS) do
    utils.map_in_buffer(buffer_number, value.mode, value.key_combination, value.command)
  end
end

local function set_diagnostic_symbols()
  for _, diagnostics_sign in pairs(CONSTANTS.DIAGNOSTICS_SIGNS) do
    local signName = 'DiagnosticSign' .. diagnostics_sign.type
    vim.fn.sign_define(signName, {
      text = diagnostics_sign.icon,
      texthl = signName, -- highlight group name is the same as the sign name
      numhl = '',
    })
  end
end

local function handle_attach(_, buffer_number)
  set_lsp_keybindings(buffer_number)
  set_diagnostic_symbols()
end

local function compose_on_attach(user_on_attach)
  return function(client, buffer_number)
    if type(user_on_attach) == 'function' then
      pcall(user_on_attach, client, buffer_number)
    end
    handle_attach(client, buffer_number)
  end
end

-- This is a workaround for the issue where the LSP server returns multiple
-- definitions for a symbol. This function will pick the first definition
-- and jump to that location.
local function handle_go_to_definition(err, results, ctx, _)
  if err or not results or vim.tbl_isempty(results) then
    return
  end
  local client = ctx and vim.lsp.get_client_by_id(ctx.client_id) or nil
  local offset_encoding = client and client.offset_encoding or 'utf-16'
  return vim.lsp.util.jump_to_location(results[1], offset_encoding)
end

M.setup_handlers = function(server_name)
  local opts = vim.tbl_deep_extend('force', {}, server_configs[server_name] or vim.empty_dict())
  opts.capabilities = vim.tbl_deep_extend('force', {}, cmp_capabilities, opts.capabilities or {})
  opts.on_attach = compose_on_attach(opts.on_attach)
  local default_handlers = {
    ['textDocument/definition'] = handle_go_to_definition,
  }
  opts.handlers = vim.tbl_extend('keep', opts.handlers or {}, default_handlers)
  local ok, err = pcall(vim.lsp.config, server_name, opts)
  if not ok then
    vim.notify(('Failed to configure LSP server %s: %s'):format(server_name, err), vim.log.levels.WARN)
  end
end

return M
