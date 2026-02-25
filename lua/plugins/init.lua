return {
	-- NvChad defaults overrides
	{
		"hrsh7th/nvim-cmp",
		enabled = false,
	},

	{
		"neovim/nvim-lspconfig",
		config = function()
			require("nvchad.configs.lspconfig").defaults()
			require("configs.lspconfig")
		end,
	},

	{
		"stevearc/conform.nvim",
		event = "BufWritePre",
		opts = require("configs.conform"),
	},

	{
		"nvim-tree/nvim-tree.lua",
		enabled = true,
		opts = function()
			local opts = require("nvchad.configs.nvimtree")
			opts.view.side = "left"
			opts.view.width = 30
			return opts
		end,
	},

	{
		"nvim-treesitter/nvim-treesitter",
		opts = {
			ensure_installed = {
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
			},
			auto_install = true,
			highlight = { enabled = true },
			indent = { enabled = true },
		},
	},

	-- Custom Plugins

	-- Completion & Snippets
	{
		"saghen/blink.cmp",
		lazy = false,
		dependencies = {
			"mikavilpas/blink-ripgrep.nvim",
			"rafamadriz/friendly-snippets",
			"milanglacier/minuet-ai.nvim",
		},
		opts = {
			sources = {
				default = { "lsp", "path", "ripgrep", "snippets", "minuet" },
				providers = {
					buffer = {
						min_keyword_length = 1,
						score_offset = 5,
					},
					minuet = {
						name = "minuet",
						module = "minuet.blink",
						async = true,
						timeout_ms = 1000,
						score_offset = 50,
						transform_items = function(_, items)
							for _, item in ipairs(items) do
								item.kind_icon = "💃🏽"
								item.labelDisplays = {
									description = "(minuet)",
								}
							end
							return items
						end,
					},
					ripgrep = {
						module = "blink-ripgrep",
						name = "Ripgrep",
						opts = {
							backend = {
								ripgrep = {
									search_casing = "smart-case",
								},
							},
						},
						transform_items = function(_, items)
							for _, item in ipairs(items) do
								item.kind_name = "File"
								item.kind_icon = "📂"
								item.labelDisplays = {
									description = "(rg)",
								}
							end
							return items
						end,
					},
				},
			},
		},
	},

	-- Picker & Navigation
	{
		"ibhagwan/fzf-lua",
		lazy = false,
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("fzf-lua").setup({})
		end,
	},
	{
		"elanmed/fzf-lua-frecency.nvim",
		dependencies = { "ibhagwan/fzf-lua" },
		keys = {
			{
				"<leader>'",
				"<cmd>lua require('fzf-lua-frecency').frecency({cwd_only=true, display_score=false})<cr>",
				desc = "Frecency",
			},
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
		"A7Lavinraj/fyler.nvim",
		dependencies = { "nvim-mini/mini.icons" },
		branch = "stable",
		opts = {},
	},
	{
		"stevearc/oil.nvim",
		opts = {},
		dependencies = { { "nvim-tree/nvim-web-devicons" } },
		lazy = false,
	},
	{
		"rgroli/other.nvim",
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
		dependencies = { { "nvim-tree/nvim-web-devicons" } },
		opts = {
			show_icons = true,
			leader_key = "\\",
			buffer_leader_key = "m",
		},
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

	-- Git stuff
	{
		"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"sindrets/diffview.nvim",
			"ibhagwan/fzf-lua",
		},
		cmd = "Neogit",
		keys = {
			{ "<leader>gg", "<cmd>Neogit kind=split_below<cr>", desc = "Show Neogit UI" },
		},
	},
	{
		"tpope/vim-fugitive",
		config = function()
			vim.keymap.set("n", "<leader>gci", "<cmd>Git commit<CR>", { silent = true, desc = "Commit the changes" })
			vim.keymap.set("n", "<leader>Gw", ":Gwrite<cr>", { silent = true, desc = "Git write" })
			vim.keymap.set("n", "<leader>Gi", ":Git<cr>", { silent = true, desc = "Git status" })
		end,
	},
	{ "akinsho/git-conflict.nvim", version = "*", config = true },
	{ "sindrets/diffview.nvim" },
	{ "esmuellert/codediff.nvim", dependencies = { "MunifTanjim/nui.nvim" }, cmd = "CodeDiff" },
	{
		"tanvirtin/vgit.nvim",
		dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons" },
		event = "VimEnter",
		config = function()
			require("vgit").setup({
				settings = { live_blame = { enabled = false } },
			})
		end,
		keys = {
			{
				"<leader>Gs",
				function()
					require("vgit").buffer_hunk_stage()
				end,
				desc = "Stage the current hunk",
			},
			{
				"<leader>GS",
				function()
					require("vgit").buffer_stage()
				end,
				desc = "Stage the current buffer",
			},
			{
				"<leader>GU",
				function()
					require("vgit").buffer_unstage()
				end,
				desc = "Unstage the current buffer",
			},
			{
				"<leader>Gci",
				function()
					require("vgit").project_commit_preview()
				end,
				desc = "Preview the commit message for the current project",
			},
			{
				"<leader>Gd",
				function()
					require("vgit").buffer_diff_preview()
				end,
				desc = "Preview the diff of the current file",
			},
		},
	},

	-- AI
	{
		"sudo-tee/opencode.nvim",
		config = function()
			require("opencode").setup({})
		end,
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MeanderingProgrammer/render-markdown.nvim",
			"saghen/blink.cmp",
			"ibhagwan/fzf-lua",
		},
	},
	{
		"milanglacier/minuet-ai.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("minuet").setup({
				provider = "gemini",
				provider_options = {
					openai = { model = "gpt-4.1-mini" },
					gemini = { model = "gemini-2.5-flash" },
				},
			})
		end,
	},
	{
		"Xuyuanp/nes.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {},
	},
	{
		"azorng/goose.nvim",
		branch = "main",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MeanderingProgrammer/render-markdown.nvim",
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

	-- Language specific
	{
		"elixir-tools/elixir-tools.nvim",
		version = "*",
		ft = { "elixir", "eex", "heex" },
		config = function()
			local elixir = require("elixir")
			local elixirls = require("elixir.elixirls")
			elixir.setup({
				nextls = { enable = true },
				elixirls = {
					enable = true,
					settings = elixirls.settings({
						dialyzerEnabled = false,
						enableTestLenses = false,
					}),
				},
				projectionist = { enable = true },
			})
		end,
	},
	{
		"kristijanhusak/vim-dadbod-ui",
		dependencies = {
			{ "tpope/vim-dadbod", lazy = true },
			{ "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true },
		},
		cmd = { "DBUI", "DBUIToggle", "DBUIAddConnection", "DBUIFindBuffer" },
		init = function()
			vim.g.db_ui_use_nerd_fonts = 1
		end,
	},

	-- Editor UI & Highlighting
	{
		"MeanderingProgrammer/render-markdown.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
		opts = { anti_conceal = { enabled = false } },
	},
	{
		"jiaoshijie/undotree",
		dependencies = "nvim-lua/plenary.nvim",
		config = true,
		keys = { { "<leader>u", "<cmd>lua require('undotree').toggle()<cr>" } },
	},
	{
		"hedyhli/outline.nvim",
		config = function()
			require("outline").setup({})
		end,
		keys = {
			{ "<leader>O", "<cmd>Outline<CR>", desc = "Toggle Outline" },
			{ "<leader>ol", "<cmd>Outline<CR>", desc = "Toggle outline" },
		},
	},
	{ "r0nsha/multinput.nvim" },
	{
		"kylechui/nvim-surround",
		config = function()
			require("nvim-surround").setup({})
		end,
	},
	{ "tpope/vim-sleuth" },
	{ "ervandew/supertab" },
	{ "axelvc/template-string.nvim" },
	{
		"zaucy/mcos.nvim",
		dependencies = { "jake-stewart/multicursor.nvim" },
		config = function()
			require("mcos").setup({})
			vim.keymap.set({ "n", "v" }, "gms", require("mcos").opkeymapfunc, { expr = true })
			vim.keymap.set({ "n" }, "gmss", require("mcos").bufkeymapfunc)
		end,
	},
	{
		"tpope/vim-abolish",
		config = function()
			vim.cmd("Abolish projcet{s} project{}")
		end,
	},
	{ "samiulsami/fFtT-highlights.nvim" },
	{
		"aaronik/treewalker.nvim",
		keys = {
			{ "<C-k>", "<cmd>Treewalker Up<cr>", mode = { "n", "v" } },
			{ "<C-j>", "<cmd>Treewalker Down<cr>", mode = { "n", "v" } },
			{ "<C-h>", "<cmd>Treewalker Left<cr>", mode = { "n", "v" } },
			{ "<C-l>", "<cmd>Treewalker Right<cr>", mode = { "n", "v" } },
		},
	},
	{
		"rachartier/tiny-inline-diagnostic.nvim",
		event = "VeryLazy",
		priority = 1000,
		config = function()
			require("tiny-inline-diagnostic").setup()
			vim.diagnostic.config({ virtual_text = false })
		end,
	},
	{
		"rachartier/tiny-glimmer.nvim",
		event = "User FilePost",
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

	-- Quickfix
	{ "kevinhwang91/nvim-bqf", ft = "qf", dependencies = { "nvim-treesitter/nvim-treesitter" } },
	{ "stevearc/quicker.nvim", event = "FileType qf", opts = {} },
	{ "gabrielpoca/replacer.nvim", event = "FileType qf", opts = { rename_files = false } },

	-- Tasks & Projects
	{
		"Hashino/doing.nvim",
		cmd = "Do",
		keys = {
			{ "<leader>da", function() require("doing").add() end },
			{ "<leader>dn", function() require("doing").done() end },
			{ "<leader>de", function() require("doing").edit() end },
		},
	},
	{
		"zk-org/zk-nvim",
		dependencies = { "ibhagwan/fzf-lua", "nvim-lua/plenary.nvim" },
		config = function()
			require("zk").setup({ pick = "fzf-lua" })
		end,
		cmd = {
			"ZkNew",
			"ZkNewFromTitleSelection",
			"ZkNewFromContentSelection",
			"ZKIndex",
			"ZkCd",
			"ZkNotes",
			"ZkNotesFromTitle",
			"ZkInsertLink",
			"ZkMatch",
			"ZkTags",
			"ZkBuffers",
			"ZkNewFromContentSelection",
		},
		keys = {
			{ "<leader>zn", "<cmd>ZkNew<cr>", desc = "Zk New" },
			{ "<leader>zb", "<cmd>ZkBuffers<cr>", desc = "Zk Buffers" },
		},
	},
	{
		"letieu/jira.nvim",
		cmd = { "Jira" },
		opts = {
			jira = {
				base = os.getenv("JIRA_BASE_URL"),
				email = os.getenv("JIRA_EMAIL"),
				token = os.getenv("JIRA_TOKEN"),
				type = "basic",
				limit = 200,
			},
		},
	},

	-- Testing
	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-neotest/nvim-nio",
			"nvim-lua/plenary.nvim",
			"antoinemadec/FixCursorHold.nvim",
			"nvim-treesitter/nvim-treesitter",
			"nvim-neotest/neotest-jest",
		},
		opts = { adapters = { "neotest-jest" } },
	},

	-- Utils & Misc
	{ "wakatime/vim-wakatime", lazy = false },
	{ "alex-popov-tech/store.nvim" },
	{
		"Vigemus/iron.nvim",
		main = "iron.core",
		opts = {
			config = {
				repl_open_cmd = "vertical botright 80 split",
				scratch_repl = true,
				repl_definition = {
					sh = { command = { "fish" } },
					lua = { command = { "fish" } },
					typescript = { command = { "node" } },
				},
			},
		},
	},
	{ "stevearc/overseer.nvim", opts = {} },
	{ "Piotr1215/presenterm.nvim" },

	-- Extras from LazyVim
	{ "smjonas/inc-rename.nvim", config = true },
	{ "folke/lazydev.nvim", ft = "lua", config = true },
	{ "nvim-treesitter/nvim-treesitter-context", config = true },
	{ "echasnovski/mini.hipatterns", version = "*", config = true },
	{ "folke/todo-comments.nvim", dependencies = { "nvim-lua/plenary.nvim" }, config = true },
	{ "b0o/SchemaStore.nvim" },
	{ "folke/persistence.nvim", event = "BufReadPre", config = true },
	{ "famiu/bufdelete.nvim" },
	{ "danymat/neogen", config = true },
	{ "SmiteshP/nvim-navic", config = true },
	{ "ThePrimeagen/refactoring.nvim", dependencies = { "nvim-lua/plenary.nvim", "nvim-treesitter/nvim-treesitter" }, config = true },

	-- Themes (optional, as user uses 'camouflage')
	{ "cooperuser/glowbeam.nvim" },
	{ "morhetz/gruvbox" },
	{ "sainnhe/everforest" },
	{ "szammyboi/dune.nvim" },
	{
		"srushti/my.vim",
		dependencies = { "rktjmp/lush.nvim" },
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd("colorscheme camouflage")
		end,
	},
}
