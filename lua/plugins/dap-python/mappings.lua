local map = vim.keymap.set

map({ "n" }, "<leader>dpr", function()
  require("dap-python").test_method()
end, { desc = "Debug python run" })
