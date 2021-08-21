vim.cmd [[packadd packer.nvim]]

return require('packer').startup({
  function()
    use('wbthomason/packer.nvim');
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
      'projekt0n/github-nvim-theme',
      config = function()
        require('plugins.github-nvim-theme');
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
  end,
  config = {
    display = {
      open_fn = require('packer.util').float,
    }
  }
});
