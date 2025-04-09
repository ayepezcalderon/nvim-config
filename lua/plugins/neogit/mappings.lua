local map = vim.keymap.set

map({ "n" }, "<leader>gg", "<cmd>Neogit<cr>", { desc = "Neogit" })

map({ "n" }, "<leader>gw", "<cmd>Neogit worktree<cr>", { desc = "Neogit worktree" })
