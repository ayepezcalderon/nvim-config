local map = vim.keymap.set

map({ "n" }, "<leader>cp",
  "<cmd>MarkdownPreviewToggle<cr>",
  {
    desc = "Markdown Preview Toggle",
  }
)
