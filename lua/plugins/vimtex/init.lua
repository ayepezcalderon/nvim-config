---------- INIT ---------
local function _init()
  vim.api.nvim_command("filetype plugin on")

  vim.g.vimtex_compiler_method = "latexmk"

  -- vim.g.vimtex_grammar_textidote = {
  --             jar = '/opt/textidote/textidote.jar',
  --             args = '--check en',
  -- }

  vim.g.vimtex_view_method = "zathura"

  vim.g.vimtex_quickfix_ignore_filters = {
    'Overfull',
    'Underfull',
  }
end

return {
  "lervag/vimtex",
  lazy = false,
  init = _init,
}
