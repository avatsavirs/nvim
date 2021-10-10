local cmp = require('cmp');
local set_custom_completion_kinds = require('plugins.nvim-cmp.set_custom_completion_kinds');
local custom_tab_handler = require('plugins.nvim-cmp.custom_tab_handler');

cmp.setup({
  completion = {
    -- For auto-selecting the first item in the menu
    completeopt = 'menu,menuone,noinsert',
  },
  sources = {
    -- List of all the sources to be used by nvim-cmp
    -- See the requires list for nvim-cmp in plugins/init.lua
    { name = 'nvim_lsp' },
    { name = 'buffer' },
    { name = 'path' },
  },
  snippet = {
    -- Completion for snippets
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body);
    end,
  },
  -- Formatting completion menu
  formatting = {
    format = set_custom_completion_kinds,
  },
  -- Custom keybindings
  mapping = {
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    }),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<Tab>'] = custom_tab_handler,
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
  }
});
