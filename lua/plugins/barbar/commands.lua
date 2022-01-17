local function initialize()
  vim.api.nvim_exec([[
  command! BetterCloseAllButCurrent lua require('plugins.barbar.utils').betterCloseAllButCurrent()
  ]], true)
end

return {
  initialize = initialize
}
