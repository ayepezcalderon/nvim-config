local map = vim.keymap.set

map(
  {"n"},
  "<leader>dlb",
  function()
    require'telescope'.extensions.dap.list_breakpoints{}
  end,
  {desc="List breakpoints"}
)
map(
  {"n"},
  "<Leader>df",
  function()
    require'telescope'.extensions.dap.frames{}
  end,
  {desc="dap frames"}
)