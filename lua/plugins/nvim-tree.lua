local map = require('utils').map;

local nvimtree_options = {
  width = 66,
  ignore = { ".git", "node_modules", ".cache", "language-servers" },
  auto_close = 1,
  follow = 1,
  hide_dotfiles = 1,
  git_hl = 0,
  highlight_opened_files = 1,
  root_folder_modifier = ":t",
  tab_open = 0,
  lsp_diagnostics = 1,
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
vim.g.nvim_tree_bindings = {
  { key = "l", cb = tree_cb("edit") },
  { key = { "h", "<BS>" }, cb = tree_cb("close_node") },
  { key = "yy", cb = tree_cb("copy") },
  { key = "x", cb = tree_cb("cut") },
  { key = "dd", cb = tree_cb("remove") },
  { key = "}", cb = tree_cb("next_sibling") },
  { key = "{", cb = tree_cb("prev_sibling") },
}

map('n', '<Leader>e', ':NvimTreeToggle<CR>', {silent = true})
--[[ vim.cmd 'highlight NvimTreeFolderName guifg=blue'
vim.cmd 'highlight NvimTreeOpenedFolderName guifg=blue gui=bold,underline' ]]
