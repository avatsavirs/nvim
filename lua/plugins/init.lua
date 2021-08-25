vim.cmd [[packadd packer.nvim]]

return require('packer').startup({
  function(use)
    use('wbthomason/packer.nvim');
    use({
      'neovim/nvim-lspconfig',
      config = function()
        require('plugins.nvim-lspconfig');
      end
    });
    use({
      'hrsh7th/nvim-compe',
      config = function()
        require('plugins.nvim-compe');
      end
    });
    use({
      'nvim-treesitter/nvim-treesitter',
      config = function()
        require('plugins.nvim-treesitter');
      end,
      run = ":TSUpdate"
    });
    use({
      'kyazdani42/nvim-tree.lua',
      config = function()
        require('plugins.nvim-tree');
      end,
      requires = {'kyazdani42/nvim-web-devicons'}
    });
    use({
      'folke/tokyonight.nvim',
      config = function()
        require('plugins.tokyonight');
      end
    });
    use({
      'hoob3rt/lualine.nvim',
      config = function()
        require('plugins.lualine');
      end,
      requires = {'kyazdani42/nvim-web-devicons'},
    });
    use({
      'romgrk/barbar.nvim',
      config = function()
        require('plugins.barbar');
      end
    });
    use({
      'lukas-reineke/indent-blankline.nvim',
      config = function()
        require('plugins.indent-blankline');
      end
    });
    use('tpope/vim-surround');
    use({
      'windwp/nvim-autopairs',
      config = function()
        require('plugins.nvim-autopairs');
      end
    });
    use({
      'windwp/nvim-ts-autotag',
      config = function()
        require('plugins.nvim-ts-autotag')
      end
    });
    use('b3nj5m1n/kommentary');
    use ({
      'nvim-telescope/telescope.nvim',
      requires = {'nvim-lua/plenary.nvim'},
      config = function()
        require('plugins.telescope');
      end
    });
    use({
      'mhartington/formatter.nvim',
      config = function ()
        require('plugins.formatter');
      end
    });
    use({
      'wincent/loupe',
      config = function ()
        require('plugins.loupe');
      end
    });
    use('dense-analysis/ale');
  end,
  config = {
    display = {
      open_fn = require('packer.util').float,
    }
  }
});
