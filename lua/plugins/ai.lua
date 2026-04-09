return {
	{
		"carlos-algms/agentic.nvim",

		opts = {
			-- Any ACP-compatible provider works. Built-in: "claude-agent-acp" | "gemini-acp" | "codex-acp" | "opencode-acp" | "cursor-acp" | "copilot-acp" | "auggie-acp" | "mistral-vibe-acp" | "cline-acp" | "goose-acp"
			provider = "goose-acp", -- setting the name here is all you need to get started
		},

		-- these are just suggested keymaps; customize as desired
		keys = {
			{
				"<C-\\>",
				function()
					require("agentic").toggle()
				end,
				mode = { "n", "v", "i" },
				desc = "Toggle Agentic Chat",
			},
			{
				"<C-'>",
				function()
					require("agentic").add_selection_or_file_to_context()
				end,
				mode = { "n", "v" },
				desc = "Add file or selection to Agentic to Context",
			},
			{
				"<C-,>",
				function()
					require("agentic").new_session()
				end,
				mode = { "n", "v", "i" },
				desc = "New Agentic Session",
			},
			{
				"<A-i>r", -- ai Restore
				function()
					require("agentic").restore_session()
				end,
				desc = "Agentic Restore session",
				silent = true,
				mode = { "n", "v", "i" },
			},
			{
				"<leader>ad", -- ai Diagnostics
				function()
					require("agentic").add_current_line_diagnostics()
				end,
				desc = "Add current line diagnostic to Agentic",
				mode = { "n" },
			},
			{
				"<leader>aD", -- ai all Diagnostics
				function()
					require("agentic").add_buffer_diagnostics()
				end,
				desc = "Add all buffer diagnostics to Agentic",
				mode = { "n" },
			},
		},
	},
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
