# Neovim 0.10.0 Config

## Options

| Option         | Value                                       | Effect                                                                                 |
| -------------- | ------------------------------------------- | -------------------------------------------------------------------------------------- |
| termguicolors  | true                                        | Enables 24-bit RGB color in the Terminal UI                                            |
| number         | true                                        | Get line numbers                                                                       |
| relativenumber | true                                        | Get relative numbers                                                                   |
| wrap           | false                                       | Workd wrap                                                                             |
| cursorline     | true                                        | Highlight the line cursor is on                                                        |
| tabstop        | 2                                           | Number of spaces that a <Tab> in the file counts for.                                  |
| shiftwidth     | 2                                           | Number of spaces to use for each step of (auto)indent.                                 |
| expandtab      | true                                        | Convert Tabs to spaces                                                                 |
| swapfile       | false                                       | No swap files                                                                          |
| writebackup    | false                                       | No backup                                                                              |
| undofile       | true                                        | Preserve undohistory in a file so it is can be used after quiting vim                  |
| undodir        | vim.fn.stdpath('config') .. '.undo_history' | Location of undofiles                                                                  |
| splitright     | true                                        | Open vertical split on right by default                                                |
| ignorecase     | true                                        | Ignore case while searching                                                            |
| smartcase      | true                                        | Override the 'ignorecase' option if the search pattern contains upper case characters. |
| confirm        | true                                        | Show confirmation prompt on closing unsaved buffer                                     |
| signcolumn     | 'yes'                                       | Always show sign column                                                                |
| iskeyword      | append('-')                                 | Consider hello-world as a single word                                                  |
| showmode       | false                                       | Don't show current mode in statusline                                                  |
| hidden         | true                                        | Hide buffer instead of closing on buffer change                                        |
| autoread       | true                                        | Update vim if a file changes from outside of vim                                       |
| shortmess      | append('I')                                 | Disable introduction screen on startup                                                 |

## Keymappings

Leader: Spacebar

| Mode   | Keymapping      | Action                        |
| ------ | --------------- | ----------------------------- |
| normal | Leader + /      | Toggle hlsearch               |
| normal | Leader + Leader | Clear command line            |
| normal | 0               | Move to start of current line |
| visual | >               | Indent visual block to right  |
| visual | <               | Indent visual block to left   |
| normal | Control + k     | Scroll up                     |
| normal | Control + j     | Scroll down                   |

## Plugins

### Installed plugins list

- [LuaSnip](https://github.com/L3MON4D3/LuaSnip)(Snippet Engine for Neovim written in Lua)

- [barbar.nvim](https://github.com/romgrk/barbar.nvim)(Tabline manager)

- [cmp-buffer](https://github.com/hrsh7th/cmp-buffer)(nvim-cmp buffer source)

- [cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp)(nvim-cmp lsp source)

- [cmp-path](https://github.com/hrsh7th/cmp-path)(nvim-cmp path source)

- [indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim)(Show indentlines)

- [kommentary](https://github.com/b3nj5m1n/kommentary)(Code comments)

- [lazygit.nvim](https://github.com/kdheepak/lazygit.nvim)(Launch lazygit in a floating window inside neovim)

- [loupe](https://github.com/wincent/loupe)(Better searching operations)

- [lualine.nvim](https://github.com/hoob3rt/lualine.nvim)(Status line)

- [nvim-autopairs](https://github.com/windwp/nvim-autopairs)(Autocomplete quotes/brackers)

- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)(For autocomplete)

- [nvim-lsp-install](https://github.com/kabouzeid/nvim-lspinstall)(Easily install language servers)

- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)(Configure nvim native lsp)

- [nvim-tree.lua](https://github.com/kyazdani42/nvim-tree.lua)(File Explorer)

- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)(AST parser)

- [nvim-ts-autotag](https://github.com/windwp/nvim-ts-autotag)(Autocomplete html tags)

- [nvim-web-devicons](https://github.com/kyazdani42/nvim-web-devicons)(Icons)

- [plenary.nvim](https://github.com/nvim-lua/plenary.nvim)(Utility functions)

- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)(Search)

- [tokyonight.nvim](https://github.com/folke/tokyonight.nvim)(Theme)

- [vim-surround](https://github.com/tpope/vim-surround)(Extend vim functions for brackets/tags/quotes realted operations)

### Add more plugins

The plugins are managed using [lazy.nvim](https://github.com/folke/lazy.nvim).
To add a plugin go to lua/plugins/init.lua and go to the lazy.nvim setup function call.
Add the new plugin to the list of plugins inside the spec field.

```lua
local lazy = require('lazy')

lazy.setup({
    spec = {
        ... -- Other plugins
        {
            'new_plugin',
            config = function()
                require('plugins.new_plugin') -- import the plugin configuration file if needed
            end
            ... -- Other configurations
        },
    }
})
```

## Colorscheme

- [Tokyonight](https://github.com/folke/tokyonight.nvim) - Night mode

## LSP

### Installed language servers

- bashls
- clangd
- cssls
- efm (For linting and auto-formatting)
- emmet_ls
- graphql
- html
- typescript
- pyright
- sumenko_lua
- tsserver
  More language servers can be installed using `nvim-lspinstall`'s `:LspInstall <server_name>`

## Treesitter

### Installed language parsers

- bash
- c
- cpp
- css
- dockerfile
- dot
- graphql
- html
- javascript
- jsdoc
- json
- lua
- markdown
- python
- regex
- tsx
- typescript
- yaml
