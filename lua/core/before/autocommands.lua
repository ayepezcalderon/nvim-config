local opt = vim.opt

vim.api.nvim_create_augroup('Colorcolumns', { clear = true })
vim.api.nvim_create_autocmd({"BufRead", "BufNewFile", "BufEnter", "BufWinEnter"}, {
  pattern = {"*.py"},
  group = 'Colorcolumns',
  callback = function() opt.colorcolumn = '88' end,
})

-- dont list quickfix buffers
vim.api.nvim_create_autocmd("FileType", {
  pattern = "qf",
  callback = function()
    vim.opt_local.buflisted = false
  end,
})
