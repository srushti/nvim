return {
	---@type LazySpec
	{
		"elanmed/fzf-lua-frecency.nvim",
		dependencies = { "ibhagwan/fzf-lua" },
		keys = {
			{
				"<leader>'",
				"<cmd>lua require('fzf-lua-frecency').frecency({cwd_only=true, display_score=false})<cr>",
				desc = "Frecency",
			},
			-- { "<leader>'", ":FzfLua frecency cwd_only=true<cr>", desc = "Frecency" },
		},
	},
	{
		"otavioschwanck/fzf-lua-explorer.nvim",
		dependencies = { "ibhagwan/fzf-lua" },
		keys = {
			{ "<leader>e", "<cmd>lua require('fzf-lua-explorer').explorer()<cr>", desc = "Explorer" },
		},
		config = function()
			require("fzf-lua-explorer").setup()
		end,
	},
	{
		"otavioschwanck/fzf-lua-enchanted-files",
		event = "LazyFile",
		dependencies = { "ibhagwan/fzf-lua" },
		keys = {
			{ "<leader>z", ":FzfLuaFiles<CR>", "Open related file", { silent = true } },
		},
		config = function()
			vim.g.fzf_lua_enchanted_files = {
				max_history_per_cwd = 50,
			}
		end,
	},
	{
		"ibhagwan/fzf-lua",
		keys = {
			{ "<leader><space>", LazyVim.pick("files", { root = false }), desc = "Find Files (cwd)" },
		},
	},
	{
		"A7Lavinraj/fyler.nvim",
		dependencies = { "nvim-mini/mini.icons" },
		branch = "stable", -- Use stable branch for production
		opts = {},
	},
	{
		"stevearc/oil.nvim",
		---@module 'oil'
		---@type oil.SetupOpts
		opts = {},
		-- Optional dependencies
		dependencies = { { "nvim-tree/nvim-web-devicons" } },
		-- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
		lazy = false,
	},
	{
		"rgroli/other.nvim",
		event = "LazyFile",
		config = function()
			require("other-nvim").setup({
				mappings = {
					{
						context = "test",
						pattern = "/(.*)/(.*).ts$",
						target = {
							{ target = "/%1/%2.test.ts" },
							{ target = "/%1/%2.spec.ts" },
						},
					},
					{ context = "controller", pattern = "/(.*)/(.*).service.ts$", target = "/%1/%2.controller.ts" },
					{ context = "service", pattern = "/(.*)/(.*).controller.ts$", target = "/%1/%2.service.ts" },
					{ context = "source", pattern = "/(.*)/(.*).spec.ts$", target = "/%1/%2.ts" },
					{ context = "source", pattern = "/(.*)/(.*).test.ts$", target = "/%1/%2.ts" },
				},
				showMissingFiles = false,
			})
		end,
		keys = {
			{ "<leader>oo", ":Other<CR>", "Open related file", { silent = true } },
		},
	},
	{
		"otavioschwanck/arrow.nvim",
		dependencies = {
			{ "nvim-tree/nvim-web-devicons" },
		},
		opts = {
			show_icons = true,
			leader_key = "\\", -- Recommended to be a single key
			buffer_leader_key = "m", -- Per Buffer Mappings
		},
	},
	{
		"saghen/blink.pairs",
		version = "*", -- (recommended) only required with prebuilt binaries

		-- download prebuilt binaries from github releases
		dependencies = "saghen/blink.download",

		--- @module 'blink.pairs'
		--- @type blink.pairs.Config
		opts = {},
	},
	{
		"leath-dub/snipe.nvim",
		keys = {
			{
				"gb",
				function()
					require("snipe").open_buffer_menu()
				end,
				desc = "Open Snipe buffer menu",
			},
		},
		opts = { sort = "last" },
	},
}
