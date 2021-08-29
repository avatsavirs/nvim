vim.api.nvim_exec([[
augroup RefreshAutogroup
  autocmd!
  autocmd FocusGained,BufEnter,UIEnter,VimResume * :checktime
augroup END
]], true);
