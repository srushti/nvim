return {
	{ "cooperuser/glowbeam.nvim", event = "VeryLazy" },
	{ "morhetz/gruvbox", event = "VeryLazy" },
	{ "sainnhe/everforest", event = "VeryLazy" },
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
