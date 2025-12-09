return {
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			"OXY2DEV/markview.nvim",
		},
		lazy = false, -- nvim-treesitter should not be lazy-loaded
		branch = "main",
		build = ":TSUpdate",
		init = function(plugin)
			-- Add nvim-treesitter to runtime path early
			require("lazy.core.loader").add_to_rtp(plugin)
		end,
		cmd = { "TSUpdateSync", "TSUpdate", "TSInstall", "TSUninstall" },
		opts = {
			-- Install parsers synchronously (only applied to `ensure_installed`)
			sync_install = false,
			-- Automatically install missing parsers when entering buffer
			auto_install = true,
		},
		config = function(_, opts)
			-- Install the required parsers
			local parsers_to_install = {
				"bash",
				"c",
				"diff",
				"elixir",
				"eex",
				"heex",
				"gleam",
				"html",
				"javascript",
				"jsdoc",
				"json",
				"jsonc",
				"lua",
				"luadoc",
				"luap",
				"markdown",
				"markdown_inline",
				"printf",
				"python",
				"query",
				"regex",
				"toml",
				"tsx",
				"typescript",
				"vim",
				"vimdoc",
				"xml",
				"yaml",
			}

			-- Setup nvim-treesitter with options
			require("nvim-treesitter").setup(opts)

			-- Install parsers asynchronously
			require("nvim-treesitter").install(parsers_to_install)

			-- Enable treesitter highlighting for all supported filetypes
			vim.api.nvim_create_autocmd("FileType", {
				pattern = "*",
				callback = function()
					pcall(vim.treesitter.start)
				end,
			})

			-- Specifically ensure Elixir highlighting
			vim.api.nvim_create_autocmd("FileType", {
				pattern = { "elixir", "eex", "heex" },
				callback = function()
					vim.treesitter.start()
				end,
			})
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		event = "VeryLazy",
		enabled = true,
	},
	{
		"rachartier/tiny-inline-diagnostic.nvim",
		event = "VeryLazy", -- Or `LspAttach`
		priority = 1000, -- needs to be loaded in first
		config = function()
			require("tiny-inline-diagnostic").setup()
			vim.diagnostic.config({ virtual_text = false }) -- Only if needed in your configuration, if you already have native LSP diagnostics
		end,
	},
}
