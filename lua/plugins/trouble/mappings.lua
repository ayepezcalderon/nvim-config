local map = vim.keymap.set

map({ "n" },
  "<leader>tw",
  "<cmd>Trouble diagnostics toggle focus=true<cr>",
  { desc = "Toggle diagnostics" }
)

map(
  { "n" },
  "<leader>tg",
  "<cmd>Trouble diagnostics toggle filter.buf=0 focus=true<cr>",
  { desc = "Toggle buffer diagnostics" }
)

map(
  { "n" },
  "<leader>ts", "<cmd>Trouble symbols toggle focus=true<cr>",
  { desc = "Toggle symbols" }
)

map(
  { "n" },
  "<leader>ta",
  "<cmd>Trouble lsp_document_symbols toggle focus=true win.position=right<cr>",
  { desc = "Toggle all LSP symbols" }
)

map(
  { "n" },
  "<leader>tq",
  "<cmd>Trouble qflist toggle focus=true<cr>",
  { desc = "Toggle quickfix" }
)

map(
  { "n" },
  "<leader>tl",
  "<cmd>Trouble lsp toggle focus=true win.position=right<cr>",
  { desc = "LSP Definitions / references / ..." }
)

map({ "n" }, "<leader>to",
  "<cmd>Trouble loclist toggle focus=true<cr>, focus=true",
  { desc = "Toggle loclist" })

map(
  { "n" },
  "<leader>tr",
  "<cmd>Trouble lsp_references toggle focus=true",
  { desc = "Toggle LSP references" }
)

map(
  { "n" },
  "<leader>tS",
  "<cmd>Trouble lsp_references toggle focus=true",
  { desc = "Toggle LSP references" }
)
