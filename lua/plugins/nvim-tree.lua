local nvim_tree = require('nvim-tree')
local map = require('utils').map

local tree_cb = require('nvim-tree.config').nvim_tree_callback

nvim_tree.setup({
    hijack_cursor = true,
    renderer = {
        highlight_opened_files = 'icons',
        highlight_git = false,
        root_folder_modifier = ':t',
        indent_markers = {
            enable = true,
        },
        icons = {
            glyphs = {
                default = '',
                symlink = '',
                folder = {
                    default = '',
                    open = '',
                    empty = '',
                    empty_open = '',
                    symlink = '',
                },
            },
        },
    },
    diagnostics = {
        enable = true,
        icons = {
            hint = '',
            info = '',
            warning = '',
            error = '',
        },
    },
    git = {
        enable = false,
    },
    update_focused_file = {
        enable = true,
    },
    view = {
        number = true,
        relativenumber = true,
        width = 65,
        mappings = {
            list = {
                { key = 'l', cb = tree_cb('edit') },
                { key = { 'h', '<BS>' }, cb = tree_cb('close_node') },
                { key = 'yy', cb = tree_cb('copy') },
                { key = 'x', cb = tree_cb('cut') },
                { key = 'dd', cb = tree_cb('remove') },
                { key = '}', cb = tree_cb('next_sibling') },
                { key = '{', cb = tree_cb('prev_sibling') },
                { key = '<C-k>', cb = '<C-y>' },
            },
        },
    },
    filters = {
        dotfiles = false,
        custom = { '.git', 'node_modules', '.cache', 'language-servers', '.undo_history' },
    },
})

map('n', '<Leader>e', ':NvimTreeToggle<CR>')
