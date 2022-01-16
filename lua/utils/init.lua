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

function utils.set_option(option_name, option_value)
	local mode = 'set';
	local value = option_value;
	if (type(option_value)=='table') then
		mode = option_value.mode;
		value = option_value.value;
	end
	if (mode=='set') then
		vim.opt[option_name] = value;
	elseif(mode=='append') then
		vim.opt[option_name]:append(value);
	end
end

return utils;
