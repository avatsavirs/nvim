local CONSTANTS = require('constants')

local uv = vim.uv or vim.loop
local BIGFILE_SIZE = CONSTANTS.BIGFILE_SIZE
local BIGFILE_LINE = CONSTANTS.BIGFILE_LINE

local M = {}

local augroup = vim.api.nvim_create_augroup('BigFile', { clear = true })

local function is_bigfile_var(buf)
  local ok, val = pcall(vim.api.nvim_buf_get_var, buf, 'bigfile')
  return ok and val
end

local function is_watch_var(buf)
  local ok, val = pcall(vim.api.nvim_buf_get_var, buf, 'bigfile_watch')
  return ok and val
end

local function is_bigfile_by_size(path)
  if path == '' then
    return false
  end

  local ok, stat = pcall(uv.fs_stat, path)
  return ok and stat and stat.size > BIGFILE_SIZE
end

local function get_buf_size(buf)
  local line_count = vim.api.nvim_buf_line_count(buf)
  local ok, size = pcall(vim.api.nvim_buf_get_offset, buf, line_count)
  if ok and size then
    return size
  end

  return nil
end

local function is_bigfile_by_line(buf)
  local line = vim.api.nvim_buf_get_lines(buf, 0, 1, false)[1]
  return line and #line > BIGFILE_LINE
end

local function is_bigfile_content(buf)
  local size = get_buf_size(buf)
  if size and size > BIGFILE_SIZE then
    return true
  end

  local path = vim.api.nvim_buf_get_name(buf)
  if is_bigfile_by_size(path) then
    return true
  end

  return is_bigfile_by_line(buf)
end

local function get_win_for_buf(buf)
  local wins = vim.fn.win_findbuf(buf)
  if wins and #wins > 0 then
    return wins[1]
  end

  return vim.api.nvim_get_current_win()
end

local function save_opts(buf, win)
  local ok = pcall(vim.api.nvim_buf_get_var, buf, 'bigfile_saved_opts')
  if ok then
    return
  end

  local opts = {
    buf = {
      swapfile = vim.api.nvim_get_option_value('swapfile', { scope = 'local', buf = buf }),
      undofile = vim.api.nvim_get_option_value('undofile', { scope = 'local', buf = buf }),
      synmaxcol = vim.api.nvim_get_option_value('synmaxcol', { scope = 'local', buf = buf }),
    },
    win = {
      cursorline = vim.api.nvim_get_option_value('cursorline', { scope = 'local', win = win }),
      foldmethod = vim.api.nvim_get_option_value('foldmethod', { scope = 'local', win = win }),
      foldenable = vim.api.nvim_get_option_value('foldenable', { scope = 'local', win = win }),
      spell = vim.api.nvim_get_option_value('spell', { scope = 'local', win = win }),
      list = vim.api.nvim_get_option_value('list', { scope = 'local', win = win }),
      signcolumn = vim.api.nvim_get_option_value('signcolumn', { scope = 'local', win = win }),
    },
  }

  vim.api.nvim_buf_set_var(buf, 'bigfile_saved_opts', opts)
end

local function set_local_opts(buf, opts)
  vim.api.nvim_buf_call(buf, function()
    for name, value in pairs(opts) do
      vim.opt_local[name] = value
    end
  end)
end

local function set_win_opts(win, opts)
  if not vim.api.nvim_win_is_valid(win) then
    return
  end

  for name, value in pairs(opts) do
    vim.api.nvim_set_option_value(name, value, { win = win })
  end
end

local function disable_features(buf)
  local win = get_win_for_buf(buf)
  save_opts(buf, win)

  set_local_opts(buf, {
    swapfile = false,
    undofile = false,
    synmaxcol = 200,
  })

  set_win_opts(win, {
    cursorline = false,
    foldmethod = 'manual',
    foldenable = false,
    spell = false,
    list = false,
    signcolumn = 'no',
  })

  pcall(vim.treesitter.stop, buf)
end

local function restore_opts(buf)
  local ok, saved = pcall(vim.api.nvim_buf_get_var, buf, 'bigfile_saved_opts')
  if not ok or type(saved) ~= 'table' then
    return
  end

  if saved.buf then
    set_local_opts(buf, saved.buf)
  end

  if saved.win then
    local win = get_win_for_buf(buf)
    set_win_opts(win, saved.win)
  end

  pcall(vim.api.nvim_buf_del_var, buf, 'bigfile_saved_opts')
end

local function enable_features(buf)
  restore_opts(buf)

  local ok_parser, parser = pcall(vim.treesitter.get_parser, buf)
  if ok_parser and parser then
    local ok_query = pcall(vim.treesitter.query.get, parser:lang(), 'highlights')
    if ok_query then
      pcall(vim.treesitter.start, buf)
    end
  end

  if vim.fn.exists(':LspStart') == 2 then
    vim.cmd('LspStart')
  end
end

function M.is_marked(buf)
  return is_bigfile_var(buf)
end

function M.is_bigfile(buf)
  return is_bigfile_var(buf) or is_bigfile_content(buf)
end

function M.mark_bigfile(buf, reason)
  if is_bigfile_var(buf) then
    return
  end

  pcall(vim.api.nvim_buf_del_var, buf, 'bigfile_watch')
  vim.api.nvim_buf_set_var(buf, 'bigfile', reason or true)
  disable_features(buf)
end

function M.clear_bigfile(buf)
  if not is_bigfile_var(buf) then
    return
  end

  pcall(vim.api.nvim_buf_del_var, buf, 'bigfile')
  vim.api.nvim_buf_set_var(buf, 'bigfile_watch', true)
  enable_features(buf)
end

function M.recheck(buf)
  buf = buf or vim.api.nvim_get_current_buf()

  if is_bigfile_content(buf) then
    if not is_bigfile_var(buf) then
      M.mark_bigfile(buf, 'recheck')
    end
    return false
  end

  if is_bigfile_var(buf) then
    M.clear_bigfile(buf)
  end

  return true
end

vim.api.nvim_create_autocmd('BufReadPre', {
  group = augroup,
  callback = function(args)
    local path = vim.api.nvim_buf_get_name(args.buf)
    if is_bigfile_by_size(path) then
      M.mark_bigfile(args.buf, 'size')
    end
  end,
})

vim.api.nvim_create_autocmd('BufReadPost', {
  group = augroup,
  callback = function(args)
    if is_bigfile_var(args.buf) then
      return
    end

    if is_bigfile_by_line(args.buf) then
      M.mark_bigfile(args.buf, 'line')
    end
  end,
})

vim.api.nvim_create_autocmd({ 'TextChanged', 'TextChangedI' }, {
  group = augroup,
  callback = function(args)
    if not is_watch_var(args.buf) then
      return
    end

    M.recheck(args.buf)
  end,
})

vim.api.nvim_create_autocmd('LspAttach', {
  group = augroup,
  callback = function(args)
    if not is_bigfile_var(args.buf) then
      return
    end

    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client and client.name == 'null-ls' then
      return
    end

    vim.schedule(function()
      pcall(vim.lsp.buf_detach_client, args.buf, args.data.client_id)
    end)
  end,
})

return M
