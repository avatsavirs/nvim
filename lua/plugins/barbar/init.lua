local barbar = require('barbar')
require('plugins.barbar.commands').initialize()
local CONSTANTS = require('plugins.barbar.constants')
local utils = require('utils')

for _, value in ipairs(CONSTANTS.KEY_MAPPINGS) do
  utils.map(value.mode, value.key_combination, value.command)
end

barbar.setup({
  animation = false,
  auto_hide = false,
  clickable = false,
})
