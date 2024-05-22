local map = vim.keymap.set

map('n', '<leader>gco', '<cmd>:Git commit<CR>', {
  desc = ":Git commit"
})

map('n', '<leader>gcu',
  function()
    vim.cmd('Git add -u')
    vim.cmd('Git commit')
  end,
  {
    desc = "Git update and commit"
  }
)

map('n', '<leader>gca',
  function()
    vim.cmd('Git add --all')
    vim.cmd('Git commit')
  end,
  {
    desc = "Git add all and commit"
  }
)
