local utils = require("utils.lsp")

return {
  cmd = { "ruff", "server" },
  root_markers = { "pyproject.toml", "ruff.toml", ".ruff.toml" },
  filetypes = utils.get_filetypes("ruff"),
  trace = "messages",
  init_options = {
    settings = {
      logLevel = "debug",
    },
  },
}
