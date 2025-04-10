return vim.tbl_deep_extend("force", require("lspconfig.configs.clangd")["default_config"], {
  cmd = { 'clangd', '--background-index' },
  root_markers = { 'compile_commands.json', 'compile_flags.txt' },
  filetypes = { 'c', 'cpp', 'fdas' },
})
