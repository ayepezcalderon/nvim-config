local map = vim.keymap.set

map(
  {"i"},
  "<C-l>",
  '<Right>',
  {desc="Move right"}
)
map(
  {"i"},
  "<C-k>",
  '<Up>',
  {desc="Move up"}
)
map(
  {"i"},
  "<C-e>",
  '<End>',
  {desc="End of line"}
)
map(
  {"i"},
  "<C-b>",
  '<ESC>^i',
  {desc="Beginning of line"}
)
map(
  {"i"},
  "<C-h>",
  '<Left>',
  {desc="Move left"}
)
map(
  {"i"},
  "<C-j>",
  '<Down>',
  {desc="Move down"}
)
map(
  {"x"},
  "p",
  'p:let @+=@0<CR>:let @"=@0<CR>',
  {desc="Dont copy replaced text"}
)
map(
  {"n"},
  "<C-k>",
  '<cmd> TmuxNavigateUp<CR>',
  {desc="Window up"}
)
map(
  {"n"},
  "<Esc>",
  '<cmd> noh <CR>',
  {desc="Clear highlights"}
)
map(
  {"n"},
  "<C-j>",
  '<cmd> TmuxNavigateDown<CR>',
  {desc="Window down"}
)
map(
  {"n"},
  "<C-s>",
  '<cmd> w <CR>',
  {desc="Save file"}
)
map(
  {"n"},
  "<C-l>",
  '<cmd> TmuxNavigateRight<CR>',
  {desc="Window right"}
)
map(
  {"n"},
  "<leader>rn",
  '<cmd> set rnu! <CR>',
  {desc="Toggle relative number"}
)
map(
  {"n"},
  "<C-p>",
  '<C-I>',
  {desc="Jump to next (<C-i> remap)"}
)
map(
  {"n"},
  "<C-h>",
  '<cmd> TmuxNavigateLeft<CR>',
  {desc="Window left"}
)
map(
  {"n"},
  "<leader>n",
  '<cmd> set nu! <CR>',
  {desc="Toggle line number"}
)
map(
  {"n"},
  "<C-c>",
  '<cmd> %y+ <CR>',
  {desc="Copy whole file"}
)
map(
  {"n", "v"},
  "<leader>fm",
  function()
    vim.lsp.buf.format { async = true }
  end,
  {desc="LSP formatting"}
)
map(
  {"v"},
  "<",
  '<gv',
  {desc="Indent line"}
)
map(
  {"v"},
  ">",
  '>gv',
  {desc="Indent line"}
)