local utils = {};

function utils.map(mode, key_combination, command, options)
	local default_options = {noremap = true, silent = true}; -- All mappings are non-recursive and silent by default
	if options then
		for index, option in pairs(options) do
			default_options[index] = option;
		end
	end
	vim.api.nvim_set_keymap(mode, key_combination, command, default_options);
end

function utils.map_in_buffer(buffer_number, mode, key_combination, command, options)
	local default_options = {noremap = true, silent = true}; -- All mappings are non-recursive and silent by default
	if options then
		for index, option in pairs(options) do
			default_options[index] = option;
		end
	end
  vim.api.nvim_buf_set_keymap(buffer_number, mode, key_combination, command, default_options);
end

function utils.set_option(option_name, option_value)
	if (type(option_value)=='function') then
		vim.opt[option_name] = option_value(vim.opt[option_name]._value);
  else
		vim.opt[option_name] = option_value;
	end
end

utils.join_paths = function(...)
  return table.concat({ ... }, '/')
end

return utils;
