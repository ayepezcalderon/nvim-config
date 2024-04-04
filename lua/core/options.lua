local opt = vim.opt
local o = vim.o

opt.relativenumber = true
o.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
vim.cmd('set nofixeol')

