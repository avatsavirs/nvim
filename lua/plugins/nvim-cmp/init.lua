local cmp = require('cmp');
local custom_select_next = require('plugins.nvim-cmp.custom_select_next');
local set_custom_completion_kinds = require('plugins.nvim-cmp.set_custom_completion_kinds');

cmp.setup({
  mapping = {
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    ['<Tab>'] = custom_select_next,
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    })
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'buffer' },
    { name = 'path' },
    { name = 'vsnip' }
  },
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body);
    end,
  },
  formatting = {
    format = set_custom_completion_kinds,
  }
});
