local map = vim.keymap.set

map({ "n" }, "<leader>e", "<cmd> NvimTreeFocus <CR>", { desc = "Focus nvimtree" })
map({ "n" }, "<C-n>", "<cmd> NvimTreeToggle <CR>", { desc = "Toggle nvimtree" })
