local map = require('utils').map;

map('n', '<Space>', '<Nop>');
vim.g.mapleader = ' ';

map('n', '<Leader>/', ':set hlsearch!<CR>'); -- <Space> + / to toggle highlight.
map('n', '<Leader><Leader>', ':<BS>', {silent = false}); -- <Space><Space> to clear command line.
map('n', '0', '^'); -- 0 moves cursor to the first character in the line instead of the absolute beginning of the line.
map('n', 'j', 'gj'); -- Moving down on wrapped lines
map('n', 'k', 'gk'); -- Moving up on wrapped lines
map('v', '>', '>gv'); -- Keep block visually highlighted on >
map('v', '<', '<gv'); -- Keep block visually highlighted on <
map('n', '<C-j>', '<C-e>'); -- Scroll down
map('n', '<C-k>', '<C-y>'); -- Scroll up
