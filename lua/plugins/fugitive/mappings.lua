local map = vim.keymap.set

map("n", "<leader>fi", "<cmd>:Git<CR>", {
  desc = "Fugitive",
})

map("n", "<leader>co", function()
  vim.cmd("Git commit")
  vim.api.nvim_feedkeys("i", "n", false)
end, {
  desc = "Git commit",
})

map("n", "<leader>cu", function()
  vim.cmd("Git add -u")
  vim.cmd("Git commit")
  vim.api.nvim_feedkeys("i", "n", false)
end, {
  desc = "Git update and commit",
})

map("n", "<leader>cU", function()
  vim.cmd("Git add --all")
  vim.cmd("Git commit")
  vim.api.nvim_feedkeys("i", "n", false)
end, {
  desc = "Git add all and commit",
})

map("n", "<leader>gP", "<cmd>:Git pull<CR>", {
  desc = "Git pull",
})

map("n", "<leader>gp", "<cmd>:Git push<CR>", {
  desc = "Git push",
})

map("n", "<leader>gb", "<cmd>:Git blame<CR>", {
  desc = "Git blame",
})
