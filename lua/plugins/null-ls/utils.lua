local null_ls = require('null-ls')
local CONSTANTS = require('plugins.null-ls.constants')
local bigfile = require('autocommands.bigfile')

local warned_missing_sources = {}

local function warn_missing_source(source_type, source)
  local key = source_type .. ':' .. source
  if warned_missing_sources[key] then
    return
  end
  warned_missing_sources[key] = true
  vim.notify(
    ('none-ls source is not available and will be skipped: %s (%s)'):format(source, source_type),
    vim.log.levels.WARN
  )
end

local function get_sources()
  local result = {}
  for source_type, sources in pairs(CONSTANTS.SOURCES) do
    local source_bucket = null_ls.builtins[source_type]
    for _, source in pairs(sources) do
      local source_builtin = source_bucket and source_bucket[source] or nil
      if source_builtin then
        table.insert(result, source_builtin)
      else
        warn_missing_source(source_type, source)
      end
    end
  end
  return result
end

local function format()
  local buffer_number = vim.api.nvim_get_current_buf()
  local is_bigfile = bigfile.is_marked(buffer_number)

  vim.lsp.buf.format({
    async = not is_bigfile,
    timeout_ms = is_bigfile and 60000 or nil,
    filter = function(client)
      return client.name == 'null-ls' -- only allow null-ls to format
    end,
  })

  if is_bigfile then
    bigfile.recheck(buffer_number)
  end
end

local function format_on_save(server, buffer_number)
  local is_formatting_supported = server.supports_method('textDocument/formatting')
  if not is_formatting_supported then
    return
  end
  local augroup = vim.api.nvim_create_augroup('LspFormatting', vim.empty_dict())
  vim.api.nvim_clear_autocmds({ group = augroup, buffer = buffer_number })
  vim.api.nvim_create_autocmd('BufWritePre', {
    group = augroup,
    buffer = buffer_number,
    callback = function()
      vim.lsp.buf.format({
        bufnr = buffer_number,
        filter = function(client)
          return client.name == 'null-ls' -- only allow null-ls to format
        end,
      })
    end,
  })
end

local function on_attach(server, buffer_number)
  format_on_save(server, buffer_number)
end

return {
  get_sources = get_sources,
  on_attach = on_attach,
  format = format,
}
