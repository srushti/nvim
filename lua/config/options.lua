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

require("vim._core.ui2").enable({
	enable = true, -- Whether to enable or disable the UI.
	msg = { -- Options related to the message module.
		---@type 'cmd'|'msg' Default message target, either in the
		---cmdline or in a separate ephemeral message window.
		---@type string|table<string, 'cmd'|'msg'|'pager'> Default message target
		---or table mapping |ui-messages| kinds and triggers to a target.
		targets = "cmd",
		cmd = { -- Options related to messages in the cmdline window.
			height = 0.5, -- Maximum height while expanded for messages beyond 'cmdheight'.
		},
		dialog = { -- Options related to dialog window.
			height = 0.5, -- Maximum height.
		},
		msg = { -- Options related to msg window.
			height = 0.5, -- Maximum height.
			timeout = 4000, -- Time a message is visible in the message window.
		},
		pager = { -- Options related to message window.
			height = 1, -- Maximum height.
		},
	},
})

vim.opt.completeopt:append("popup")

vim.opt.winborder = "rounded"
