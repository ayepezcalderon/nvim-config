local map = vim.keymap.set

map({ "n" }, "<leader>ma", "<cmd> Telescope marks <CR>", { desc = "telescope bookmarks" })

map({ "n" }, "<leader>fe", "<cmd> Telescope buffers <CR>", { desc = "Find buffers" })

map({ "n" }, "<leader>fh", "<cmd> Telescope help_tags <CR>", { desc = "Help page" })

map({ "n" }, "<leader>cm", "<cmd> Telescope git_commits <CR>", { desc = "Git commits" })

map({ "n" }, "<leader>pt", "<cmd> Telescope terms <CR>", { desc = "Pick hidden term" })

map({ "n" }, "<leader>gs", "<cmd> Telescope git_status <CR>", { desc = "Git status" })

map({ "n" }, "<leader>fw", "<cmd> Telescope live_grep <CR>", { desc = "Live grep" })

map({ "n" }, "<leader>fz", "<cmd> Telescope current_buffer_fuzzy_find <CR>", { desc = "Find in current buffer" })

map({ "n" }, "<leader>fo", "<cmd> Telescope oldfiles <CR>", { desc = "Find oldfiles" })

map({ "n" }, "<leader>ff", "<cmd> Telescope find_files <CR>", { desc = "Find files" })

map({ "n" }, "<leader>fk", "<cmd> Telescope keymaps <CR>", { desc = "Find keymaps" })

map(
  { "n" },
  "<leader>fa",
  "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>",
  { desc = "Find all" }
)

map({ "n", "v" }, "<leader>fy", "<cmd> Telescope yank_history <CR>", { desc = "Yank history" })

map({ "n" }, "<leader>fls", "<cmd> Telescope lsp_document_symbols <CR>", { desc = "Document/buffer LSP symbols" })

map({ "n" }, "<leader>flw", function()
  -- iterator with matches from input
  local match = string.gmatch(vim.fn.input("<query> [symbol]: "), "%S+")

  -- terminate if no input
  local query = match()
  if not query then
    return
  end

  -- perform search
  require("telescope.builtin").lsp_workspace_symbols({ query = query, symbols = match() })
end, { desc = "Workspace LSP symbols" })
