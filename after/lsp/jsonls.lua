local utils = require("utils.lsp")

return {
  cmd = { 'vscode-json-language-server', '--stdio' },
  filetypes = utils.get_filetypes("jsonls"),
  init_options = {
    provideFormatter = true,
  },
  single_file_support = true,
}
