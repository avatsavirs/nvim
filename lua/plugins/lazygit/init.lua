local lazygit = require('lazygit')
local map = require('utils').map
local CONSTANTS = require('constants')

vim.g.lazygit_use_custom_config_file_path = 1
vim.g.lazygit_config_file_path = CONSTANTS.CONFIG_BASE_PATH .. '/lua/plugins/lazygit/lazygit-nvim.yml'

_G.close_lazygit_terminals = function()
  for _, buffer in ipairs(vim.api.nvim_list_bufs()) do
    if vim.api.nvim_buf_is_valid(buffer) then
      local buftype = vim.api.nvim_get_option_value('buftype', { buf = buffer })
      local name = vim.api.nvim_buf_get_name(buffer)
      if buftype == 'terminal' and name:find('lazygit', 1, true) then
        for _, win in ipairs(vim.fn.win_findbuf(buffer)) do
          pcall(vim.api.nvim_win_close, win, true)
        end
        pcall(vim.api.nvim_buf_delete, buffer, { force = true })
      end
    end
  end
end

local function open_lazygit_in_current_nvim()
  local server = vim.v.servername
  if server == nil or server == '' then
    -- start server if neovim RPC server has not started when lazygit is launched.
    local socket = CONSTANTS.RUN_PATH .. '/nvim-lazygit-' .. vim.fn.getpid() .. '.sock'
    local ok, started = pcall(vim.fn.serverstart, socket)
    if ok and type(started) == 'string' and started ~= '' then
      server = started
    end
  end

  if server ~= nil and server ~= '' then
    vim.env.NVIM = server
    local quoted_server = vim.fn.shellescape(server)
    local editor = 'nvim --server ' .. quoted_server .. ' --remote-tab'
    vim.env.EDITOR = editor
    vim.env.VISUAL = editor
    vim.env.GIT_EDITOR = editor .. ' --remote-wait'
  end

  lazygit.lazygit()
end

local function open_lazgit_logs()
  lazygit.lazygitlog()
end

map('n', '<Leader>gg', open_lazygit_in_current_nvim)
map('n', '<Leader>gl', open_lazgit_logs)
