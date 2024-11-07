local map = vim.keymap.set

map("n", "<leader>fi", "<cmd>:Git<CR>", {
  desc = "Fugitive",
})

map("n", "<leader>co", "<cmd>:Git commit<CR>", {
  desc = "Git commit",
})

map("n", "<leader>cu", function()
  vim.cmd("Git add -u")
  vim.cmd("Git commit")
end, {
  desc = "Git update and commit",
})

map("n", "<leader>cU", function()
  vim.cmd("Git add --all")
  vim.cmd("Git commit")
end, {
  desc = "Git add all and commit",
})

map("n", "<leader>gp", "<cmd>:Git pull<CR>", {
  desc = "Git pull",
})

map("n", "<leader>gP", "<cmd>:Git push<CR>", {
  desc = "Git push",
})
