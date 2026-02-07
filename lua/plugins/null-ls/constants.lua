local M = {}

M.SOURCE_TYPE = {
  FORMATTING = 'formatting',
  DIAGNOSTICS = 'diagnostics',
  CODE_ACTIONS = 'code_actions',
  COMPLETION = 'completion',
  HOVER = 'hover',
}

M.SOURCES = {
  [M.SOURCE_TYPE.FORMATTING] = {
    'stylua',
    'prettierd',
    'gofmt',
  },
  [M.SOURCE_TYPE.DIAGNOSTICS] = {},
  [M.SOURCE_TYPE.CODE_ACTIONS] = {},
  [M.SOURCE_TYPE.COMPLETION] = {},
  [M.SOURCE_TYPE.HOVER] = {},
}

return M
