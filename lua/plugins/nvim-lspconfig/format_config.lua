local eslint = {
  lintCommand = 'eslint_d -f unix --stdin --stdin-filename ${INPUT}',
  lintIgnoreExitCode = false,
  lintStdin = true,
  lintFormats = { '%f:%l:%c: %m' },
}

local prettier = {
  formatCommand = 'prettier --stdin-filepath ${INPUT}',
  formatStdin = true,
}

local stylua = { formatCommand = 'stylua -s -', formatStdin = true }

local format_config = {
  javascript = { prettier, eslint },
  javascriptreact = { prettier, eslint },
  typescript = { prettier, eslint },
  typescriptreact = { prettier, eslint },
  css = { prettier },
  html = { prettier },
  json = { prettier },
  lua = { stylua },
  markdown = { prettier },
  scss = { prettier },
  yaml = { prettier },
}

return format_config;
