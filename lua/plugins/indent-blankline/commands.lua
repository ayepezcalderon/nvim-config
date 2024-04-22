--- toggles highlight for IndentBlanklineContextStart from given color to nothing
local function toggle_context_start()
  local new_config = {
    bg = "#363545",
  }
  local curr_config = vim.api.nvim_get_hl(0, {name = "IndentBlanklineContextStart"})
  if not vim.deep_equal(curr_config, vim.empty_dict()) then
    vim.api.nvim_set_hl(0, "IndentBlanklineContextStart", {})
  else
    vim.api.nvim_set_hl(0, "IndentBlanklineContextStart", new_config)
  end
end
vim.api.nvim_create_user_command('ToggleIndentBlanklineContextStart', toggle_context_start, {
  nargs = 0,
  desc = 'Toggle highlighting for IndentBlanklineContextStart',
})
