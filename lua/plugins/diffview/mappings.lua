local map = vim.keymap.set

map(
  { "n" },
  "<leader>gd",
  "<cmd>DiffviewOpen<cr>",
  { desc = "DiffviewOpen (default diff against HEAD, including untracked files)" }
)

map({ "n" }, "<leader>gl", "<cmd>DiffviewFileHistory %<cr>", { desc = "Diffview log on current file" })

map({ "n" }, "<leader>gL", "<cmd>DiffviewFileHistory<cr>", { desc = "Diffview log on repo" })
