return {
  "mbbill/undotree",
  lazy = false,
  config = function(_, opts)
    -- mappings
    vim.keymap.set('n', '<leader>uu', vim.cmd.UndotreeToggle)

    -- options in the form of global variables
    vim.g.undotree_SetFocusWhenToggle = 1
  end
}
