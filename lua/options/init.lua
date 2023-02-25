local utils = require('utils')
local CONSTANTS = require('options.constants')

for key, value in pairs(CONSTANTS.options) do
    utils.set_option(key, value)
end
