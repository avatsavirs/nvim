local nvim_tree = require'nvim-tree'
local map = require('utils').map;

local nvimtree_options = {
  git_hl = 0,
  highlight_opened_files = 1,
  root_folder_modifier = ":t",
  indent_markers = 1,
  show_icons = {
    git = 0,
    folders = 1,
    files = 1
  },
  icons = {
    default = "",
    symlink = "",
    folder = {
      default = "",
      open = "",
      empty = "",
      empty_open = "",
      symlink = "",
    },
  },
}

for opt, val in pairs(nvimtree_options) do
  vim.g["nvim_tree_" .. opt] = val
end

local tree_cb = require'nvim-tree.config'.nvim_tree_callback;

nvim_tree.setup({
  open_on_tab = false,
  auto_close = true,
  diagnostics = {
    enable = true,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "" ,
    }
  },
  hijack_cursor = true,
  update_focused_file = {
    enable = true,
  },
  view = {
    width = 65,
    mappings = {
      list = {
        { key = "l", cb = tree_cb("edit") },
        { key = { "h", "<BS>" }, cb = tree_cb("close_node") },
        { key = "yy", cb = tree_cb("copy") },
        { key = "x", cb = tree_cb("cut") },
        { key = "dd", cb = tree_cb("remove") },
        { key = "}", cb = tree_cb("next_sibling") },
        { key = "{", cb = tree_cb("prev_sibling") },
      }
    }
  },
  filters = {
    dotfiles = false,
    custom = { ".git", "node_modules", ".cache", "language-servers", ".undo_history" }
  }
})

map('n', '<Leader>e', ':NvimTreeToggle<CR>');
