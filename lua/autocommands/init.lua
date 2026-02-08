local augroup = vim.api.nvim_create_augroup('DynamicCmdLine', vim.empty_dict())

vim.api.nvim_create_autocmd({ "CmdwinEnter", "RecordingEnter" }, {
  group = augroup,
  callback = function()
    vim.opt.cmdheight = 1
  end,
})

vim.api.nvim_create_autocmd({ "CmdwinLeave", "RecordingLeave" }, {
  group = augroup,
  callback = function()
    if vim.fn.reg_recording() == '' and vim.fn.reg_executing() == '' then
      vim.opt.cmdheight = 0
    end
  end,
})

require('autocommands.bigfile')
