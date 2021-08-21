require('formatter').setup({
  logging = false,
  filetype = {
    javascriptreact = {
      function()
        return {
          exe = "npx prettier",
          args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0)},
          stdin = true,
        }
      end
    },
    javascript = {
      function()
        return {
          exe = "npx prettier",
          args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0)},
          stdin = true
        }
      end
    },
    typescriptreact = {
      function()
        return {
          exe = "npx prettier",
          args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0)},
          stdin = true
        }
      end
    },
    typescript = {
      function()
        return {
          exe = "npx prettier",
          args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0)},
          stdin = true
        }
      end
    },
  }
});

vim.api.nvim_exec([[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost *.js,*.jsx,*.ts,*.tsx FormatWrite
augroup END
]], true);
