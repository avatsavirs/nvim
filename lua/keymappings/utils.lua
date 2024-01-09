local M = {}

M.openLastFile = function()
  local oldfiles = vim.v.oldfiles
  if oldfiles and #oldfiles > 0 then
    local most_recent_oldfile = oldfiles[1]
    if most_recent_oldfile then
      vim.cmd('edit ' .. vim.fn.fnameescape(most_recent_oldfile))
    else
      print('No recent files found')
    end
  else
    print('No recent files found')
  end
end

return M
