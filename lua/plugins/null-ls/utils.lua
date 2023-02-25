local null_ls = require('null-ls')
local CONSTANTS = require('plugins.null-ls.constants');

local function get_sources()
  local result = {};
  for source_type, sources in pairs(CONSTANTS.SOURCES) do
    for _, source in pairs(sources) do
      table.insert(result, null_ls.builtins[source_type][source]);
    end
  end
  return result;
end

local function format_on_save(server, buffer_number)
  local is_formatting_supported = server.supports_method('textDocument/formatting');
  if not is_formatting_supported then
    return;
  end
  local augroup = vim.api.nvim_create_augroup('LspFormatting', vim.empty_dict());
  vim.api.nvim_clear_autocmds({ group = augroup, buffer = buffer_number });
  vim.api.nvim_create_autocmd('BufWritePre', {
    group = augroup,
    buffer = buffer_number,
    callback = function()
      vim.lsp.buf.format({
        buffer_number = buffer_number,
        filter = function(client)
          return client.name == 'null-ls' -- only allow null-ls to format
        end
      });
    end,
  })
end

local function on_attach(server, buffer_number)
  format_on_save(server, buffer_number);
end

return {
  get_sources = get_sources,
  on_attach = on_attach,
};
