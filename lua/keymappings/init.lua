local map = require('utils').map
local keymappings_utils = require('keymappings.utils')

map('n', '<Space>', '<Nop>')
vim.g.mapleader = ' '

map('n', '<Leader>uh', ':set hlsearch!<CR>') -- <Space> + u + h to toggle highlight.
map('n', '<Leader><Leader>', ':<BS>', { silent = false }) -- <Space><Space> to clear command line.
map('n', '0', '^') -- 0 moves cursor to the first character in the line instead of the absolute beginning of the line.
map('v', '>', '>gv') -- Keep block visually highlighted on >
map('v', '<', '<gv') -- Keep block visually highlighted on <
map('n', '<C-j>', '<C-e>') -- Scroll down
map('n', '<C-k>', '<C-y>') -- Scroll up
map('n', '<C-o>', keymappings_utils.jumpBackWithStartupBufferCleanup)
map('n', 'k', '(v:count > 2 ? "m\'" .. v:count : "") .. "gk"', { expr = true }) -- Convert numbered up motion to jump, g is for moving down wrapped lines,
map('n', 'j', '(v:count > 2 ? "m\'" .. v:count : "") .. "gj"', { expr = true }) -- Convert numbered down motion to jump, g is for moving down wrapped lines,
