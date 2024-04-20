local map = vim.keymap.set

map(
  {"n"},
  "<tab>",
  "<cmd>:BufferLineCycleNext<CR>",
  {desc="Go to next buffer"}
)
map(
  {"n"},
  "<S-tab>",
  "<cmd>:BufferLineCyclePrev<CR>",
  {desc="Go to previous buffer"}
)
map(
  {"n"},
  "<leader>gp",
  "<cmd>:BufferLinePick<CR>",
  {desc="Pick buffer to open"}
)
map(
  {"n"},
  "<leader>gc",
  "<cmd>:BufferLinePickClose<CR>",
  {desc="Pick buffer to close"}
)
