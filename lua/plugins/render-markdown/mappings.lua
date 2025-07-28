local map = vim.keymap.set

map("n", "<leader>cl", function()
  require('render-markdown').toggle()
end, { desc = "Toggle Render Markdown" })
