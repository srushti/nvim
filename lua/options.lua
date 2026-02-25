require "nvchad.options"

local opt = vim.opt
local o = vim.o

vim.g.mapleader = ","
opt.swapfile = false
opt.mouse = "nv"

o.guifont = "Cascadia Code NF:h12"

o.cursorcolumn = true
o.colorcolumn = "120"
o.number = true
o.relativenumber = false
opt.clipboard = ""

vim.g.completeopt = "menu,menuone,noselect,fuzzy,nosort"
