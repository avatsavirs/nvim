local CONSTANTS = require('plugins.nvim-treesitter.constants')
local GLOBAL_CONSTANTS = require('constants')

local uv = vim.uv or vim.loop
local BIGFILE_SIZE = GLOBAL_CONSTANTS.BIGFILE_SIZE
local BIGFILE_LINE = GLOBAL_CONSTANTS.BIGFILE_LINE

local function is_bigfile(buf)
  local ok, val = pcall(vim.api.nvim_buf_get_var, buf, 'bigfile')
  if ok and val then
    return true
  end

  local path = vim.api.nvim_buf_get_name(buf)
  if path ~= '' then
    local ok_stat, stat = pcall(uv.fs_stat, path)
    if ok_stat and stat and stat.size > BIGFILE_SIZE then
      return true
    end
  end

  local line = vim.api.nvim_buf_get_lines(buf, 0, 1, false)[1]
  return line and #line > BIGFILE_LINE
end

require('nvim-treesitter.configs').setup({
  ensure_installed = CONSTANTS.PARSER_INSTALL_LIST, -- checks and install all parsers in list
  sync_install = false, -- parsers listed in ensure_installed are installed asynchronously
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = true,
    disable = function(_, buf)
      return is_bigfile(buf)
    end,
  },
  indent = {
    enable = true,
    disable = function(_, buf)
      return is_bigfile(buf)
    end,
  },
  incremental_selection = {
    enable = true,
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ['af'] = { query = '@function.outer', desc = 'Select outer part of a function region' },
        ['if'] = { query = '@function.inner', desc = 'Select inner part of a function region' },
        ['ac'] = { query = '@class.outer', desc = 'Select outer part of a class region' },
        ['ic'] = { query = '@class.inner', desc = 'Select inner part of a class region' },
      },
    },
    move = {
      enable = true,
      set_jumps = true,
      goto_previous_start = {
        ['[f'] = { query = '@function.outer', desc = 'Go to previous function start' },
        ['[c'] = { query = '@class.outer', desc = 'Go to previous class start' },
      },
      goto_next_end = {
        [']f'] = { query = '@function.outer', desc = 'Go to next function end' },
        [']c'] = { query = '@class.outer', desc = 'Go to next class end' }, -- go to end of the current class
      },
    },
  },
})
