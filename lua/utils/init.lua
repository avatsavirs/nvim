local utils = {}

function utils.map(mode, key_combination, command, options)
  local default_options = { noremap = true, silent = true } -- All mappings are non-recursive and silent by default
  local keymap_options = vim.tbl_extend('force', default_options, options or {}) -- merge default options with custom options args
  vim.keymap.set(mode, key_combination, command, keymap_options)
end

function utils.map_in_buffer(buffer_number, mode, key_combination, command, options)
  local default_options = { noremap = true, silent = true } -- All mappings are non-recursive and silent by default
  local keymap_options = vim.tbl_extend('force', default_options, options or {}) -- merge default options with custom options args
  vim.api.nvim_buf_set_keymap(buffer_number, mode, key_combination, command, keymap_options)
end

function utils.set_option(option_name, option_value)
  if type(option_value) == 'function' then
    vim.opt[option_name] = option_value(vim.opt[option_name]._value) -- current value for `option_name` is passed to `option_value` callback function.
  else
    vim.opt[option_name] = option_value
  end
end

function utils.join_paths(...)
  return table.concat({ ... }, '/')
end

return utils
