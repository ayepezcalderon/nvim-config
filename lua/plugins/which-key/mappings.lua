local map = vim.keymap.set

map(
  {"n"},
  "<leader>wk",
  function()
    local input = vim.fn.input "WhichKey: "
    vim.cmd("WhichKey " .. input)
  end,
  {desc="Which-key query lookup"}
)
map(
  {"n"},
  "<leader>wK",
  function()
    vim.cmd "WhichKey"
  end,
  {desc="Which-key all keymaps"}
)