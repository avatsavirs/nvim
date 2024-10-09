local CONSTANTS = require('constants')
local utils = require('utils')

-- Bootstrap lazy.nvim
local lazypath =  CONSTANTS.DATA_BASE_PATH .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

local lazy = require('lazy')

lazy.setup(
  {
    spec = {
      {
        "folke/tokyonight.nvim", -- Editor Theme
        lazy = false,
        priority = 1000,
        config = function()
          require("plugins.tokyonight")
        end,
      },
      {
        "nvim-tree/nvim-tree.lua", -- File Explorer
        config = function()
          require("plugins.nvim-tree")
        end,
        dependencies = {
          "nvim-tree/nvim-web-devicons"
        },
      },
      {
        "nvim-telescope/telescope.nvim", -- Search
        config = function()
          require("plugins.telescope")
        end,
        dependencies = {
          "nvim-lua/plenary.nvim",
        },
      },
      {
        "nvim-lualine/lualine.nvim", -- Status Line
        config = function()
          require("plugins.lualine")
        end,
        dependencies = {
          "nvim-tree/nvim-web-devicons"
        },
      },
      {
        "lukas-reineke/indent-blankline.nvim", -- Show indentlines
        config = function()
          require("plugins.indent-blankline")
        end,
      },
      {
        "kdheepak/lazygit.nvim", -- Launch lazygit in a floating window inside neovim
        config = function()
          require("plugins.lazygit")
        end,
      },
      {
        "f-person/git-blame.nvim", -- Git Blame
        config = function()
          require("plugins.git-blame")
        end,
      },
      {
        "wincent/loupe", -- Better searching
        config = function()
          require("plugins.loupe")
        end,
      },
      { "b3nj5m1n/kommentary" }, -- Code comments
      { "tpope/vim-surround" }, -- Extend vim functions for brackets/tags/quotes realted operations
      { "github/copilot.vim" }, -- Copilot
      {
        "nvim-treesitter/nvim-treesitter",  -- AST based highlighting, folding, and more
        config = function()
          require("plugins.nvim-treesitter")
        end,
      },
      {
        "nvim-treesitter/nvim-treesitter-textobjects", -- Treesitter textobjects
        config = function()
          require("plugins.nvim-treesitter")
        end,
        dependencies = {
          "nvim-treesitter/nvim-treesitter"
        },
      },
      {
        "williamboman/mason-lspconfig.nvim", -- LSP Configurations
        config = function()
          require("plugins.mason-lspconfig")
        end,
        dependencies = {
          "williamboman/mason.nvim",
          "neovim/nvim-lspconfig",
        },
      },
      {
        "jose-elias-alvarez/null-ls.nvim", -- provides a framework for aggregating and running linters, formatters, and other tools as sources of diagnostics (aka lints) and code actions.
        config = function()
          require("plugins.null-ls")
        end,
        dependencies = {
          "nvim-lua/plenary.nvim",
          "neovim/nvim-lspconfig",
        },
      },
      {
        "hrsh7th/nvim-cmp", -- Autocompletion plugin
        config = function()
          require("plugins.nvim-cmp")
        end,
        dependencies = {
          'hrsh7th/cmp-nvim-lsp', -- nvim-cmp source lsp completion
          'hrsh7th/cmp-buffer', -- nvim-cmp source for buffer completion
          'hrsh7th/cmp-path', -- nvim-cmp source for path completion
          'saadparwaiz1/cmp_luasnip', -- nvim-cmp source for lua snip
          'L3MON4D3/LuaSnip', -- nvim-cmp requires a snippet engine is required for completion
        },
      },
      {
        "romgrk/barbar.nvim", -- Tabline manager
        config = function()
          require("plugins.barbar")
        end,
      },
      {
        "windwp/nvim-autopairs", -- Autocomplete quotes/brackers
        config = function()
          require("plugins.nvim-autopairs")
        end,
      },
      {
        "windwp/nvim-ts-autotag", -- Automatically close and rename html tags
        config = function()
          require("plugins.nvim-ts-autotag")
        end,
        ft = {
          'html',
          'javascript',
          'javascriptreact',
          'typescript',
          'typescriptreact'
        },
      },
    },
    change_detection = {
      enabled = false, -- Disable file change detection for this file
    },
    root=utils.join_paths(CONSTANTS.PACK_PATH, 'pack'), -- This is where the plugins will be downloaded.
    install = {
      missing = true, -- Install missing plugins
      colorscheme ={ 'tokyonight' }, -- colorscheme when the missing plugins are being installed.
    }
  }
)
