local function betterCloseAllButCurrent()
  if(vim.fn.winnr('$') > 1) then
    vim.api.nvim_exec([[
      execute "norm \<C-w>o"
    ]], true);
  end
  vim.api.nvim_exec([[
    execute "BufferCloseAllButCurrent"
  ]], true);
end

return {
  betterCloseAllButCurrent = betterCloseAllButCurrent
}
