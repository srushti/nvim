vim.g.mapleader = ","
vim.opt.swapfile = false
vim.o.hidden = true
vim.opt.mouse = "nv"

vim.o.cursorcolumn = true
vim.o.colorcolumn = "120"
vim.o.number = true
vim.o.relativenumber = false
vim.opt.clipboard = ""
vim.o.scrolloff = 2

vim.g.lazyvim_prettier_needs_config = false

vim.g.completeopt = "menu,menuone,noselect,fuzzy,nosort"

vim.cmd.packadd("nvim.undotree")
require("vim._core.ui2").enable({})
