local utils = require('utils');
local CONSTANTS = require('constants');

vim.cmd([[ packadd packer.nvim ]]);

return require('packer').startup({
  function(use)
    use('wbthomason/packer.nvim'); -- packer manages itself
    use('github/copilot.vim'); -- github copilot
    use({
      'williamboman/mason-lspconfig.nvim', -- easily install language servers
      config = [[ require('plugins.mason-lspconfig') ]],
      requires = {
        { 'williamboman/mason.nvim' },
        { 'neovim/nvim-lspconfig' }, -- configure nvim native lsp
      }
    });
    use({
      'jose-elias-alvarez/null-ls.nvim', -- provides a framework for aggregating and running linters, formatters, and other tools as sources of diagnostics (aka lints) and code actions.
      requires = {
        { 'nvim-lua/plenary.nvim' }, -- Utility functions
        { 'neovim/nvim-lspconfig' }, -- configure nvim native lsp
      },
      config = [[ require('plugins.null-ls') ]],
    })
    use({
      "hrsh7th/nvim-cmp",
      config = [[ require('plugins.nvim-cmp') ]], -- For autocompletion
      requires = {
        "hrsh7th/cmp-nvim-lsp", -- nvim-cmp source lsp completion
        "hrsh7th/cmp-buffer", -- nvim-cmp source for buffer completion
        "hrsh7th/cmp-path", -- nvim-cmp source for path completion
        "saadparwaiz1/cmp_luasnip", -- nvim-cmp source for lua snip
        "L3MON4D3/LuaSnip", -- nvim-cmp requires a snippet engine is required for completion
      }
    });
    use({
      'nvim-treesitter/nvim-treesitter', -- AST parser
      config = [[ require('plugins.nvim-treesitter') ]],
      run = ':TSUpdate'
    });
    use({
      'nvim-telescope/telescope.nvim', -- Search
      requires = { 'nvim-lua/plenary.nvim' }, -- Utility functions
      config = [[ require('plugins.telescope') ]],
    });
    use({
      'kyazdani42/nvim-tree.lua', -- File Explorer
      config = [[ require('plugins.nvim-tree') ]],
      requires = { 'kyazdani42/nvim-web-devicons' } -- Unicode support for filetype icons
    });
    use({
      'folke/tokyonight.nvim', -- Theme
      config = [[ require('plugins.tokyonight') ]],
    });
    use({
      'nvim-lualine/lualine.nvim', -- Status line
      config = [[ require('plugins.lualine') ]],
      requires = { 'kyazdani42/nvim-web-devicons' }, -- Unicode support
    });
    use({
      'romgrk/barbar.nvim', -- Tabline manager
      config = [[ require('plugins.barbar') ]],
    });
    use({
      'lukas-reineke/indent-blankline.nvim', -- Show indentlines
      config = [[ require('plugins.indent-blankline') ]],
    });
    use('tpope/vim-surround'); -- Extend vim functions for brackets/tags/quotes realted operations
    use({
      'windwp/nvim-autopairs', -- Autocomplete quotes/brackers
      config = [[ require('plugins.nvim-autopairs') ]],
      after = 'nvim-cmp'
    });
    use({
      'windwp/nvim-ts-autotag', -- Autocomplete html tags
      ft = { 'html', 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
      config = [[ require('plugins.nvim-ts-autotag') ]],
    });
    use('b3nj5m1n/kommentary'); -- Code comments
    use({
      'wincent/loupe', -- Better searching
      config = [[ require('plugins.loupe') ]],
    });
    use({
      'kdheepak/lazygit.nvim', -- Launch lazygit in a floating window inside neovim
      config = [[ require('plugins.lazygit') ]],
    });
  end,
  config = {
    display = {
      open_fn = require('packer.util').float, -- Open packer window in floating window
      title = 'Plugins',
    },
    package_root = utils.join_paths(CONSTANTS.CONFIG_BASE_PATH, '.plugins', 'pack'),
  }
});
