-- Refresh buffer on when terminal gains focus, buffer is entered, or vim is resumes after suspension
vim.api.nvim_exec([[
augroup RefreshAutogroup
  autocmd!
  autocmd FocusGained,BufEnter,UIEnter,VimResume * :checktime
augroup END
]], true);
