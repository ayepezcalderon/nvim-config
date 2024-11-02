local M = {}

local map = vim.keymap.set

function M.nonlazy()
  map("n", "<leader>cct", "<cmd> Copilot toggle <CR>", { desc = "Copilot toggle" })
end

function M.lazy()
  map("n", "<leader>cca", function()
    require("copilot.suggestion").toggle_auto_trigger()
  end, { desc = "Copilot toggle auto-trigger" })
end

return M
