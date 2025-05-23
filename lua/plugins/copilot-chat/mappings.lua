local map = vim.keymap.set

map("n", "<leader>ccq", function()
  local input = vim.fn.input("Quick Chat: ")
  if input ~= "" then
    require("CopilotChat").ask(input, { selection = require("CopilotChat.select").buffer })
  end
end, { desc = "CopilotChat - Quick chat" })

map("n", "<leader>ccc", function()
  vim.cmd("CopilotChat")
end, { desc = "CopilotChat" })

map("v", "<leader>ccc", function()
  vim.cmd([[:'<,'> CopilotChat]])
end, { desc = "CopilotChat (visual)" })

map({ "n", "v" }, "<leader>ccp", function()
  vim.cmd(":CopilotChatStop")
end, { desc = "CopilotChatStop" })

map({ "n", "v" }, "<leader>ccp", function()
  local actions = require("CopilotChat.actions")
  require("CopilotChat.integrations.telescope").pick(actions.prompt_actions())
end, { desc = "CopilotChat - Prompt actions" })
