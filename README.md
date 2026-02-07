# Neovim 0.11+ Config

This is a Lua-based Neovim configuration managed with `lazy.nvim`.

## Requirements

- Neovim `>= 0.11`
- Git
- Nerd Font (recommended for icons)

## Core Defaults

Highlights from `lua/options/constants.lua`:

- UI: `termguicolors`, line numbers, relative numbers, cursorline
- Editing: `expandtab`, `tabstop=2`, `shiftwidth=2`
- Search: `ignorecase`, `smartcase`
- Files: persistent undo in `~/.config/nvim/.undo_history`
- Splits: vertical splits open to the right
- Cmdline UI: dynamic `cmdheight` (`0` when idle, `1` while typing commands)

## Keymaps

Leader key is `<Space>`.

- `<Leader>/`: clear search highlight (Loupe)
- `<Leader>uh`: toggle `hlsearch`
- `<Leader><Leader>`: clear command line
- `<Leader>e`: toggle file tree
- `<Leader>gg`: open LazyGit
- `<C-p>`: Telescope file search
- `<C-g>`: Telescope live grep
- `<C-b><C-b>`: Telescope buffers
- `<C-b>h` / `<C-b>l`: previous / next buffer (Barbar)
- `<C-b>q`: close current buffer (safe close command)

## Plugin Stack

### UI and navigation

- [`folke/tokyonight.nvim`](https://github.com/folke/tokyonight.nvim)
- [`nvim-tree/nvim-tree.lua`](https://github.com/nvim-tree/nvim-tree.lua)
- [`nvim-lualine/lualine.nvim`](https://github.com/nvim-lualine/lualine.nvim)
- [`romgrk/barbar.nvim`](https://github.com/romgrk/barbar.nvim)
- [`lukas-reineke/indent-blankline.nvim`](https://github.com/lukas-reineke/indent-blankline.nvim)
- [`nvim-tree/nvim-web-devicons`](https://github.com/nvim-tree/nvim-web-devicons)

### Search and workflow

- [`nvim-telescope/telescope.nvim`](https://github.com/nvim-telescope/telescope.nvim)
- [`nvim-lua/plenary.nvim`](https://github.com/nvim-lua/plenary.nvim)
- [`wincent/loupe`](https://github.com/wincent/loupe)
- [`kdheepak/lazygit.nvim`](https://github.com/kdheepak/lazygit.nvim)
- [`f-person/git-blame.nvim`](https://github.com/f-person/git-blame.nvim)

### Editing

- [`numToStr/Comment.nvim`](https://github.com/numToStr/Comment.nvim)
- [`tpope/vim-surround`](https://github.com/tpope/vim-surround)
- [`windwp/nvim-autopairs`](https://github.com/windwp/nvim-autopairs)
- [`windwp/nvim-ts-autotag`](https://github.com/windwp/nvim-ts-autotag)

### Treesitter

- [`nvim-treesitter/nvim-treesitter`](https://github.com/nvim-treesitter/nvim-treesitter)
- [`nvim-treesitter/nvim-treesitter-textobjects`](https://github.com/nvim-treesitter/nvim-treesitter-textobjects)

### LSP and tooling

- [`mason-org/mason.nvim`](https://github.com/mason-org/mason.nvim)
- [`mason-org/mason-lspconfig.nvim`](https://github.com/mason-org/mason-lspconfig.nvim)
- [`neovim/nvim-lspconfig`](https://github.com/neovim/nvim-lspconfig)
- [`nvimtools/none-ls.nvim`](https://github.com/nvimtools/none-ls.nvim)

### Completion

- [`hrsh7th/nvim-cmp`](https://github.com/hrsh7th/nvim-cmp)
- [`hrsh7th/cmp-nvim-lsp`](https://github.com/hrsh7th/cmp-nvim-lsp)
- [`hrsh7th/cmp-buffer`](https://github.com/hrsh7th/cmp-buffer)
- [`hrsh7th/cmp-path`](https://github.com/hrsh7th/cmp-path)
- [`saadparwaiz1/cmp_luasnip`](https://github.com/saadparwaiz1/cmp_luasnip)
- [`L3MON4D3/LuaSnip`](https://github.com/L3MON4D3/LuaSnip)

## LSP Architecture

- Language servers are installed/enabled through Mason + `mason-lspconfig`.
- Server configs are registered via native `vim.lsp.config(...)` (Neovim 0.11 style).
- JS/TS diagnostics come from `eslint` LSP + `ts_ls`.
- Completion capabilities are provided through `cmp-nvim-lsp`.

Configured LSP servers:

- `lua_ls`
- `rust_analyzer`
- `ts_ls`
- `eslint`
- `gopls`
- `graphql`
- `html`
- `pyright`
- `solc`
- `yamlls`
- `clangd`

## Formatting

`none-ls` is formatter-focused:

- Lua: `stylua`
- JS/TS/Web: `prettierd`
- Go: `gofmt`

Use `:Format` to format the current buffer.

## Treesitter Parsers

Configured parser install list includes:

- `bash`, `c`, `cpp`, `css`, `dockerfile`, `dot`, `go`, `graphql`
- `html`, `javascript`, `jsdoc`, `json`, `lua`, `markdown`
- `python`, `prisma`, `regex`, `rust`, `tsx`, `typescript`, `yaml`, `styled`
