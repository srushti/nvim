return {
	{
		"sudo-tee/opencode.nvim",
		config = function()
			require("opencode").setup({})
		end,
		dependencies = {
			"nvim-lua/plenary.nvim",
			{
				"MeanderingProgrammer/render-markdown.nvim",
				opts = {
					anti_conceal = { enabled = false },
					file_types = { "markdown", "opencode_output" },
				},
				ft = { "markdown", "opencode_output" },
			},
			"saghen/blink.cmp",
			"ibhagwan/fzf-lua",
		},
	},
	{
		{
			"milanglacier/minuet-ai.nvim",
			dependencies = {
				"nvim-lua/plenary.nvim",
			},
			config = function()
				require("minuet").setup({
					provider = "gemini",
					provider_options = {
						openai = {
							model = "gpt-4.1-mini",
						},
						gemini = {
							model = "gemini-2.5-flash",
						},
					},
				})
			end,
		},
	},
	{
		"Xuyuanp/nes.nvim",
		event = "VeryLazy",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		opts = {},
		keys = {
			{
				"<A-i>",
				function()
					require("nes").get_suggestion()
				end,
				mode = "i",
				desc = "[Nes] get suggestion",
			},
			{
				"<A-n>",
				function()
					require("nes").apply_suggestion(0, { jump = true, trigger = true })
				end,
				mode = "i",
				desc = "[Nes] apply suggestion",
			},
		},
	},
	{
		"azorng/goose.nvim",
		branch = "main",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{
				"MeanderingProgrammer/render-markdown.nvim",
				opts = {
					anti_conceal = { enabled = false },
				},
			},
		},
		config = function()
			require("goose").setup({
				default_global_keymaps = false,
				keymap = {
					global = {
						toggle = "<leader>ao",
						open_input = "<leader>ai",
						open_input_new_session = "<leader>aI",
						toggle_fullscreen = "<leader>af",
						select_session = "<leader>as",
					},
				},
			})
		end,
	},
}
