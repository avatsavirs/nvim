local nvim_lsp = require('lspconfig');


local servers = {
  'tsserver',
  'sumenko_lua',
  'jsonls',
  'cssls',
}

for _, server in ipairs(servers) do
  local server_config = require('plugins.nvim-lspconfig.' .. server);
  nvim_lsp[server_config.name].setup ({
    cmd = server_config.cmd,
    settings = server_config.settings,
    handlers = server_config.handlers,
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

-- nvim_lsp.diagnosticls.setup {
  -- on_attach = function(client, bufnr)
    -- local buf_map = vim.api.nvim_buf_set_keymap
    -- vim.cmd("command! LspDef lua vim.lsp.buf.definition()")
    -- vim.cmd("command! LspFormatting lua vim.lsp.buf.formatting()")
    -- vim.cmd("command! LspCodeAction lua vim.lsp.buf.code_action()")
    -- vim.cmd("command! LspHover lua vim.lsp.buf.hover()")
    -- vim.cmd("command! LspRename lua vim.lsp.buf.rename()")
    -- vim.cmd("command! LspOrganize lua lsp_organize_imports()")
    -- vim.cmd("command! LspRefs lua vim.lsp.buf.references()")
    -- vim.cmd("command! LspTypeDef lua vim.lsp.buf.type_definition()")
    -- vim.cmd("command! LspImplementation lua vim.lsp.buf.implementation()")
    -- vim.cmd("command! LspDiagPrev lua vim.lsp.diagnostic.goto_prev()")
    -- vim.cmd("command! LspDiagNext lua vim.lsp.diagnostic.goto_next()")
    -- vim.cmd(
      -- "command! LspDiagLine lua vim.lsp.diagnostic.show_line_diagnostics()")
    -- vim.cmd("command! LspSignatureHelp lua vim.lsp.buf.signature_help()")buf_map(bufnr, "n", "gd", ":LspDef<CR>", {silent = true})
    -- buf_map(bufnr, "n", "gr", ":LspRename<CR>", {silent = true})
    -- buf_map(bufnr, "n", "gR", ":LspRefs<CR>", {silent = true})
    -- buf_map(bufnr, "n", "gy", ":LspTypeDef<CR>", {silent = true})
    -- buf_map(bufnr, "n", "K", ":LspHover<CR>", {silent = true})
    -- buf_map(bufnr, "n", "gs", ":LspOrganize<CR>", {silent = true})
    -- buf_map(bufnr, "n", "[a", ":LspDiagPrev<CR>", {silent = true})
    -- buf_map(bufnr, "n", "]a", ":LspDiagNext<CR>", {silent = true})
    -- buf_map(bufnr, "n", "ga", ":LspCodeAction<CR>", {silent = true})
    -- buf_map(bufnr, "n", "<Leader>a", ":LspDiagLine<CR>", {silent = true})
    -- buf_map(bufnr, "i", "<C-x><C-x>", "<cmd> LspSignatureHelp<CR>", {silent = true})
    -- if client.resolved_capabilities.document_formatting then
      -- vim.api.nvim_exec([[
      -- augroup LspAutocommands
      -- autocmd! * <buffer>
      -- autocmd BufWritePost <buffer> LspFormatting
      -- augroup END
        -- ]], true)
    -- end
  -- end,
  -- filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
  -- init_options = {
    -- filetypes = {
      -- javascript = 'eslint',
      -- javascriptreact = 'eslint',
      -- typescript = 'eslint',
      -- typescriptreact = 'eslint',
    -- },
    -- linters = {
      -- eslint = {
        -- sourceName = 'eslint',
        -- command = 'eslint',
        -- rootPatterns = { '.git', 'package.json' },
        -- args = { '--stdin', '--stdin-filename', '%filepath', '--format', 'json' },
        -- parseJson = {
          -- errorsRoot = '[0].messages',
          -- line = 'line',
          -- column = 'column',
          -- endLine = 'endLine',
          -- endColumn = 'endColumn',
          -- message = '[eslint] ${message} [${ruleId}]',
          -- security = 'severity'
        -- },
        -- securities = {
          -- [2] = 'error',
          -- [1] = 'warning'
        -- }
      -- },
    -- },
  -- }
-- }
