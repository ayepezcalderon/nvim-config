local map = vim.keymap.set

map(
  {"v"},
  "<leader>/",
  "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
  {desc="Toggle comment"}
)
map(
  {"n"},
  "<leader>/",
  function()
    require("Comment.api").toggle.linewise.current()
  end,
  {desc="Toggle comment"}
)