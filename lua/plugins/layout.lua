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
		},
	},
	{
		"mhinz/vim-startify",
		config = function()
			local function git_modified()
				local files = vim.fn.systemlist("git ls-files -m 2>/dev/null")
				return vim.tbl_map(function(f)
					return { line = f, path = f }
				end, files)
			end

			local function git_untracked()
				local files = vim.fn.systemlist("git ls-files -o --exclude-standard 2>/dev/null")
				return vim.tbl_map(function(f)
					return { line = f, path = f }
				end, files)
			end

			local header_cmd = "basename `pwd` | figlet -f slant | lolcat"
			local fortune_cmd = "fortune -s | cowsay -rC"
			vim.g.startify_custom_header = vim.fn["startify#center"](vim.fn.split(vim.fn.system(header_cmd), "\n"))
			vim.g.startify_custom_footer = vim.fn["startify#center"](vim.fn.split(vim.fn.system(fortune_cmd), "\n"))

			vim.g.startify_lists = {
				-- { type = "files", header = { "   MRU" } },
				-- { type = "dir", header = { "   MRU " .. vim.fn.getcwd() } },
				-- { type = "sessions", header = { "   Sessions" } },
				-- { type = "bookmarks", header = { "   Bookmarks" } },
				{ type = git_modified, header = { "   git modified" } },
				{ type = git_untracked, header = { "   git untracked" } },
				{ type = "commands", header = { "   Commands" } },
			}
		end,
	},
}
