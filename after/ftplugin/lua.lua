local opt = vim.opt_local

opt.colorcolumn = "120"
opt.formatoptions:remove("o")
opt.formatoptions:remove("r")

-- treesitter
require("utils.load_plugin").set_treesitter()
