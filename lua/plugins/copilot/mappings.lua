local map = vim.keymap.set

map(
  "n",
  "<leader>cct",
  '<cmd> Copilot toggle <CR>',
  { desc = "Copilot toggle" }
)

map(
  "n",
  "<leader>cca",
  function()
    require("copilot.suggestion").toggle_auto_trigger()
  end,
  { desc = "Copilot toggle auto-trigger" }
)
