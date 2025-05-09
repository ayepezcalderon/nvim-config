local config = require("config")

---------- CONFIG ----------
local _config = function()
  require('lint').linters_by_ft = config.lsp.nvim_lint_server_spec

  vim.api.nvim_create_autocmd({ "BufWritePost" }, {
    callback = function()
      require("lint").try_lint()
    end,
  })
end

---------- RETURN ----------
local ft = {}

for filetype, _ in pairs(config.lsp.nvim_lint_server_spec) do
  table.insert(ft, filetype)
end

return {
  "mfussenegger/nvim-lint",
  ft = ft,
  config = _config,
}
