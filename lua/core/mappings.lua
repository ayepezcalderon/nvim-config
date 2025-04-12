local map = vim.keymap.set

map({ "n" }, "<leader>/", "gcc", {
  desc = "Toggle comment",
  remap = true,
})

map({ "v" }, "<leader>/", "gc", {
  desc = "Toggle comment",
  remap = true,
})

map({ "n", "v" }, "<M-k>", "5k", { desc = "Move 5 up" })

map({ "n", "v" }, "<M-j>", "5j", { desc = "Move 5 down" })

map({ "i" }, "<C-e>", "<End>", { desc = "End of line" })

map({ "i" }, "<C-b>", "<ESC>^i", { desc = "Beginning of line" })

map({ "x" }, "p", 'p:let @+=@0<CR>:let @"=@0<CR>', { desc = "Dont copy replaced text" })

map({ "n" }, "<C-k>", "<cmd> TmuxNavigateUp<CR>", { desc = "Window up" })

map({ "n" }, "<Esc>", "<cmd> noh <CR>", { desc = "Clear highlights" })

map({ "n" }, "<C-j>", "<cmd> TmuxNavigateDown<CR>", { desc = "Window down" })

map({ "n" }, "<C-s>", "<cmd> w <CR>", { desc = "Save file" })

map({ "n" }, "<C-l>", "<cmd> TmuxNavigateRight<CR>", { desc = "Window right" })

map({ "n" }, "<leader>rn", "<cmd> set rnu! <CR>", { desc = "Toggle relative number" })

map({ "n" }, "<C-p>", "<C-I>", { desc = "Jump to next (<C-i> remap)" })

map({ "n" }, "<C-h>", "<cmd> TmuxNavigateLeft<CR>", { desc = "Window left" })

map({ "n" }, "<leader>n", "<cmd> set nu! <CR>", { desc = "Toggle line number" })

map({ "n" }, "<C-c>", "<cmd> %y+ <CR>", { desc = "Copy whole file" })

map({ "v" }, "<", "<gv", { desc = "Indent line" })

map({ "v" }, ">", ">gv", { desc = "Indent line" })

map({ "n" }, "<leader>X", "<cmd>confirm bdelete<CR>", { desc = "Close buffer and window" })

map({ "n" }, "<leader>x", function()
  if vim.api.nvim_buf_is_loaded(vim.fn.bufnr("#")) then
    -- Go to last visited buffer in this session, if it exists
    vim.cmd("b # | confirm bd #")
  else
    -- Move to next buffer, and log buf before and after moving
    local current_buf = vim.api.nvim_get_current_buf()
    vim.cmd("bn")
    local new_buf = vim.api.nvim_get_current_buf()

    -- If we actually moved buffer, delete previous one
    -- Else, report that we could not move to an alternate buffer
    if current_buf ~= new_buf then
      vim.cmd("confirm bd #")
    else
      print("No alternate buffer")
    end
  end
end, { desc = "Close buffer" })

map({ "n" }, "<Tab>", function()
  vim.cmd("bnext " .. vim.v.count1)
end)

map({ "n" }, "<S-Tab>", function()
  vim.cmd("bprev " .. vim.v.count1)
end)

map({ "n" }, "<leader>z", "<cmd>confirm tabclose<CR>", { desc = "Close tab" })

map({ "n" }, "<leader>q", function()
  if vim.fn.getqflist({ winid = 0 }).winid ~= 0 then
    -- If the quickfix window is open, close it
    vim.cmd("cclose")
  else
    -- If the quickfix window is not open, open it
    vim.cmd("copen")
  end
end, { desc = "Toggle quickfix", silent = true })
