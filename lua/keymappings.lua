local map = require('utils').map;

map('n', '<Space>', '<Nop>');
vim.g.mapleader = ' ';

map('n', '<Leader>/', ':set hlsearch!<CR>'); -- <Space> + / to toggle highlight.
map('n', '<Leader><Leader>', ':<BS>', {silent = false}); -- <Space><Space> to clear command line.
map('n', '0', '^') -- 0 moves cursor to the first character in the line instead of the absolute beginning of the line.
map('n', 'j', 'gj') -- Moving down on wrapped lines
map('n', 'k', 'gk') -- Moving up on wrapped lines
map('v', '>', '>gv') -- Keep block visually highlighted on >
map('v', '<', '<gv') -- Keep block visually highlighted on <
map('c', '<Left>', '<Space><BS><Left>') -- Use arrow keys to move cursor instead of moving through wildmenu in command line
map('c', '<Right>', '<Space><BS><Right>') -- Use arrow keys to move cursor instead of moving through wildmenu in command line
