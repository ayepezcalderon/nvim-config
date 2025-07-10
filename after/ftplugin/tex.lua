local opt = vim.opt_local

opt.foldmethod = "expr"
opt.foldexpr = "vimtex#fold#level(v:lnum)"
opt.foldtext = "vimtex#fold#text()"

opt.spell = true
