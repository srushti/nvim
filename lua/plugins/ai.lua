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
				ft = { "markdown", "Avante", "opencode_output" },
			},
			"saghen/blink.cmp",
			"ibhagwan/fzf-lua",
		},
	},
	{
		"joshuavial/aider.nvim",
		config = function()
			require("aider").setup({
				auto_manage_context = true,
				default_bindings = false,
			})
		end,
		-- opts = {
		--   -- Set the provider to use. Options are: "openai", "deepseek", "gemini", "claude"
		--   auto_manage_context = true,
		--   default_bindings = false,
		-- },
		keys = {
			{
				"<leader>iao",
				":AiderOpen<CR>",
				desc = "[Aider] Open",
			},
			{
				"<leader>iam",
				":AiderAddModifiedFiles<CR>",
				desc = "[Aider] Next Aider",
			},
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
			require("goose").setup()
		end,
	},
	{
		"yetone/avante.nvim",
		event = "LazyFile",
		-- lazy = false,
		version = "*", -- Set this to "*" to always pull the latest release version, or set it to false to update to the latest code changes.
		opts = {
			-- add any opts here
			-- for example
			provider = "gemini",
			providers = {
				---@type AvanteProvider
				deepseek = {
					endpoint = "https://api.deepseek.com/chat/completions",
					model = "deepseek-coder",
					api_key_name = "DEEPSEEK_API_KEY",
				},
				openai = {
					endpoint = "https://api.openai.com/v1",
					model = "gpt-4o", -- your desired model (or use gpt-4o, etc.)
					timeout = 30000, -- timeout in milliseconds
					extra_request_body = {
						temperature = 0, -- adjust if needed
						max_tokens = 4096,
						-- reasoning_effort = "high" -- only supported for reasoning models (o1, etc.)
					},
				},
				gemini = {
					endpoint = "https://generativelanguage.googleapis.com/v1beta/models",
					model = "gemini-2.5-pro-exp-03-25",
					timeout = 30000, -- Timeout in milliseconds
					temperature = 0,
					max_tokens = 4096,
					["local"] = false,
				},
				claude = {
					endpoint = "https://api.anthropic.com",
					model = "claude-3-5-sonnet-20241022",
					extra_request_body = {
						temperature = 0,
						max_tokens = 4096,
					},
				},
			},
		},
		build = "make",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			"stevearc/dressing.nvim",
			"Kaiser-Yang/blink-cmp-avante",
			"ibhagwan/fzf-lua",
			"nvim-tree/nvim-web-devicons",
			-- "zbirenbaum/copilot.lua",
			{
				-- Make sure to set this up properly if you have lazy=true
				"MeanderingProgrammer/render-markdown.nvim",
				opts = {
					file_types = { "markdown", "Avante" },
				},
				ft = { "markdown", "Avante" },
			},
		},
	},
	-- { "giuxtaposition/blink-cmp-copilot", event = "VeryLazy", dependencies = "zbirenbaum/copilot.lua" },
	{ "Kaiser-Yang/blink-cmp-avante", event = "VeryLazy", dependencies = "yetone/avante.nvim" },
	-- {
	-- 	"zbirenbaum/copilot.lua",
	-- 	cmd = "Copilot",
	-- 	build = ":Copilot auth",
	-- 	event = "InsertEnter",
	-- 	opts = {
	-- 		suggestion = {
	-- 			enabled = false,
	-- 			auto_trigger = true,
	-- 			keymap = {
	-- 				accept = false, -- handled by nvim-cmp / blink.cmp
	-- 				next = "<M-]>",
	-- 				prev = "<M-[>",
	-- 			},
	-- 		},
	-- 		panel = { enabled = false },
	-- 		filetypes = {
	-- 			markdown = true,
	-- 			javascript = true,
	-- 			typescript = true,
	-- 			ruby = true,
	-- 			lua = true,
	-- 			help = true,
	-- 		},
	-- 	},
	-- },
}
