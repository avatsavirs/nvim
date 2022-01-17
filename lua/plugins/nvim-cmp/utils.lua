local CONSTANTS = require('plugins.nvim-cmp.constants');
local M = {};

M.set_custom_completion_kind = function (_, vim_item)
  vim_item.kind =
    CONSTANTS.COMPLETION_KINDS_SYMBOLS[vim_item.kind];
  return vim_item;
end

return M;
