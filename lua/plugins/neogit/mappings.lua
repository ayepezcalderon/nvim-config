local map = vim.keymap.set

map({ "n" },
  "<leader>ng",
  "<cmd>Neogit<cr>",
  { desc = "Neogit" }
)

map({ "n" },
  "<leader>nw",
  "<cmd>Neogit worktree<cr>",
  { desc = "Neogit worktree" }
)
