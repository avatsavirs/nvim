vim.api.nvim_exec([[
augroup RefreshAutogroup
  autocmd!
  autocmd FocusGained,BufEnter,UIEnter * :checktime
augroup END
]], true);
