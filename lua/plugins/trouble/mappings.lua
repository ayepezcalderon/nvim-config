local map = vim.keymap.set

map({ "n" }, "<leader>tw", function()
  require("trouble").toggle "workspace_diagnostics"
end, { desc = "Toggle workspace diagnostics" })
map({ "n" }, "<leader>tg", function()
  require("trouble").toggle "document_diagnostics"
end, { desc = "Toggle document diagnostics" })
map({ "n" }, "<leader>tq", function()
  require("trouble").toggle "quickfix"
end, { desc = "Toggle quickfix" })
map({ "n" }, "<leader>tl", function()
  require("trouble").toggle "loclist"
end, { desc = "Toggle loclist" })
map({ "n" }, "<leader>tx", function()
  require("trouble").toggle()
end, { desc = "Toggle trouble" })
map({ "n" }, "<leader>tr", function()
  require("trouble").toggle "lsp_references"
end, { desc = "Toggle LSP references" })
