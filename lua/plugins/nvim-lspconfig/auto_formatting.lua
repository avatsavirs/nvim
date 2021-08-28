local setup = function (client)
  -- So that the only client with format capabilities is efm
  if client.name ~= 'efm' then
    client.resolved_capabilities.document_formatting = false
  end

  if client.resolved_capabilities.document_formatting then
    vim.cmd([[
    augroup Format
    au! * <buffer>
    au BufWritePre <buffer> lua vim.lsp.buf.formatting_sync({}, 1000)
    augroup END
    ]])
  end
end

local M = {};
M.setup = setup;
return M;
