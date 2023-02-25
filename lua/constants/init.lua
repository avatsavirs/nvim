local utils = require('utils')
local CONSTANTS = {}

CONSTANTS.CONFIG_BASE_PATH = vim.fn.stdpath('config')
CONSTANTS.CACH_BASE_PATH = vim.fn.stdpath('cache')
CONSTANTS.DATA_BASE_PATH = vim.fn.stdpath('data')
CONSTANTS.UNDO_DIR = utils.join_paths(CONSTANTS.CONFIG_BASE_PATH, '.undo_history')
CONSTANTS.PACK_PATH = utils.join_paths(CONSTANTS.CONFIG_BASE_PATH, '.plugins')

return CONSTANTS
