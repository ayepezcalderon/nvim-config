-- Much taken from nvchad

vim.diagnostic.config({
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "󰅙",
      [vim.diagnostic.severity.WARN] = "󰋼",
      [vim.diagnostic.severity.INFO] = "󰌵",
      [vim.diagnostic.severity.HINT] = "",
    },
    linehl = {
      -- [vim.diagnostic.severity.ERROR] = 'ErrorMsg',
    },
    numhl = {
      [vim.diagnostic.severity.ERROR] = "ErrorMsg",
      [vim.diagnostic.severity.WARN] = "WarningMsg",
      [vim.diagnostic.severity.INFO] = "InfoMsg",
      [vim.diagnostic.severity.HINT] = "HintMsg",
    },
  },
  -- virtual_text = {
  --   prefix = "",
  --   current_line = true,
  -- },
  virtual_lines = {
    current_line = true,
  },
  underline = true,
  update_in_insert = false,
})
