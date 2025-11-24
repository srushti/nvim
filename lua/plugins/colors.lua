return {
	{ "rose-pine/neovim", name = "rose-pine", lazy = false },
	{ "cooperuser/glowbeam.nvim", event = "VeryLazy" },
	{ "lmintmate/blue-mood-vim", event = "VeryLazy" },
	{ "morhetz/gruvbox", event = "VeryLazy" },
	{ "sainnhe/everforest", event = "VeryLazy" },
	{ "khoido2003/classic_monokai.nvim", event = "VeryLazy" },
	{ "szammyboi/dune.nvim", event = "VeryLazy" },
	{ "leobeosab/tearout.nvim", event = "VeryLazy" },
	{
		"HampusHauffman/peacock.nvim",
		lazy = false,
		config = function()
			require("peacock").setup()
		end,
	},
	{
		"rktjmp/lush.nvim",
		{ dir = "~/.local/share/nvim/lazy/my.vim", lazy = true },
	},
	{
		"rachartier/tiny-glimmer.nvim",
		event = "LazyFile",
		opts = {
			enable = true,
			overwrite = {
				auto_map = true,
				yank = { enabled = true },
				paste = { enabled = true },
				undo = { enabled = true },
				redo = { enabled = true },
			},
		},
	},
}
