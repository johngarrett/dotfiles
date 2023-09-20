vim.wo.relativenumber = true

vim.opt.clipboard = ""
-- default string is: "block,hor,mark,percent,quickfix,search,tag,undo"
-- this prevents folds from being opened on search
vim.o.foldopen = "block,hor,mark,percent,quickfix,tag,undo"
