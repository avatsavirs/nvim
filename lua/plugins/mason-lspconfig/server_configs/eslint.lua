return {
  settings = {
    workingDirectory = {
      mode = 'auto',
    },
  },
  on_attach = function(client)
    -- Formatting is handled via none-ls (prettierd) for JS/TS.
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
  end,
}
