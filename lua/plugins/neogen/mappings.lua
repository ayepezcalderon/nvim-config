local map = vim.keymap.set

map({ "n" }, "<leader>cd", function()
  require("neogen").generate { type = "class" }
end, { desc = "Class docstring", noremap = true, silent = true })
map({ "n" }, "<leader>fd", function()
  require("neogen").generate { type = "func" }
end, { desc = "Function docstring", noremap = true, silent = true })
