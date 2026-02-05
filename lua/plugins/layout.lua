return {
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		---@type snacks.Config
		opts = {
			image = {},
			lazygit = {
				configure = false,
			},
			dashboard = {
				width = 50,
				sections = {
					{
						pane = 1,
						section = "terminal",
						cmd = "basename `pwd` | figlet -f slant | lolcat",
						height = 20,
						padding = 1,
					},
					{
						pane = 2,
						section = "terminal",
						cmd = "cowsay -rC `fortune -s`",
						height = 20,
						padding = 1,
					},
					{ section = "startup" },
				},
			},
		},
	},
}
