local map = vim.keymap.set

map("n", "<leader>Z", function()
  require("zen-mode").toggle()
end, { desc = "Zen Mode" })
