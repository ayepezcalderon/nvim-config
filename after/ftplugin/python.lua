local opt = vim.opt_local

opt.colorcolumn = "88"

vim.api.nvim_buf_create_user_command(0, "UvRun", function(opts)
  vim.cmd("wall")

  local file = vim.fn.expand("%:p")
  local height = tonumber(opts.args) or 15 -- default to 15 if no argument

  vim.cmd(height .. "split | terminal uv run " .. file)
end, {
  nargs = "?",
  desc = "Run `uv run` on current file in a terminal",
})

vim.api.nvim_buf_create_user_command(0, "UvRunTerm", function(opts)
  vim.cmd("wall")

  local file = vim.fn.expand("%:p")
  local height = tonumber(opts.args) or 15 -- default to 15 if no argument

  -- Open a horizontal split with terminal
  vim.cmd(height .. "split")
  vim.cmd("terminal")

  -- Send the command to the terminal
  local term_chan = vim.b.terminal_job_id
  vim.fn.chansend(term_chan, "uv run " .. file .. "\n")

  -- Enter insert mode in the terminal
  vim.cmd("startinsert")
end, {
  nargs = "?",
  desc = "Run `uv run` on current file in a persistent terminal",
})

local map = vim.keymap.set
map("n", "<F10>", ":UvRunTerm<CR>", { buffer = true, desc = "Run `uv run` in terminal" })
