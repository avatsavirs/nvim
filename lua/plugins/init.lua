vim.cmd([[ packadd packer.nvim ]]);

return require('packer').startup({
  function(use)
    use('wbthomason/packer.nvim'); -- packer manages itself
    use({
      'neovim/nvim-lspconfig', -- configure nvim native lsp
      config = [[ require('plugins.nvim-lspconfig') ]],
      requires = {
        { 'kabouzeid/nvim-lspinstall', module = 'lspinstall' }, -- easily install language servers
      }
    });
    use({
      'hrsh7th/nvim-compe', -- for autocomplete
      config = [[ require('plugins.nvim-compe') ]],
      after = "nvim-lspconfig"
    });
    use({
      'nvim-treesitter/nvim-treesitter', -- AST parser
      config = [[ require('plugins.nvim-treesitter') ]],
      run = ":TSUpdate"
    });
    use ({
      'nvim-telescope/telescope.nvim', -- Search
      requires = {'nvim-lua/plenary.nvim'}, -- Utility functions
      config = [[ require('plugins.telescope') ]],
    });
    use({
      'kyazdani42/nvim-tree.lua', -- File Explorer
      config = [[ require('plugins.nvim-tree') ]],
      requires = {'kyazdani42/nvim-web-devicons'} -- Unicode support for filetype icons
    });
    use({
      'folke/tokyonight.nvim', -- Theme
      config = [[ require('plugins.tokyonight') ]],
    });
    use({
      'hoob3rt/lualine.nvim', -- Status line
      config = [[ require('plugins.lualine') ]],
      requires = {'kyazdani42/nvim-web-devicons'}, -- Unicode support
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
    });
    use({
      'windwp/nvim-ts-autotag', -- Autocomplete html tags
      ft={'html', 'javascript', 'javascriptreact', 'typescript', 'typescriptreact'},
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
    }
  }
});
