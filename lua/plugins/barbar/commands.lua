local function initialize()
  vim.api.nvim_exec([[
  command! BetterCloseAllButCurrent lua require('plugins.barbar.utils').betterCloseAllButCurrent()
  ]], true);
  vim.api.nvim_exec([[
  command! BetterBufferClose lua require('plugins.barbar.utils').betterBufferClose()
  ]], true)
end

return {
  initialize = initialize
}
