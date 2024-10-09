local augroup = vim.api.nvim_create_augroup('DynamicCmdLine', vim.empty_dict())

vim.api.nvim_create_autocmd({ "CmdlineEnter", "CmdwinEnter", "RecordingEnter" }, {
  group = augroup,
  callback = function()
    vim.opt.cmdheight = 1
  end,
})

vim.api.nvim_create_autocmd({ "CmdlineLeave", "CmdwinLeave", "RecordingLeave" }, {
  group = augroup,
  callback = function()
    vim.opt.cmdheight = 0
  end,
})
