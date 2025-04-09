local map = vim.keymap.set

map({ "n" }, "<leader>ck", "<cmd>TSContextToggle<cr>", { desc = "Toggle context header" })

map({ "n" }, "[o", function()
  require("treesitter-context").go_to_context(vim.v.count1)
end, {
  desc = "Jump to treesitter-context header",
  silent = true,
})
