return {
	{
		"srushti/apple-music.nvim",

		event = "VeryLazy",

		opts = {
			auto_start = true,
			notify_track = false,
		},

		init = function()
			local ok, wk = pcall(require, "which-key")
			if ok then
				wk.add({ { "<leader>m", group = " Music" } })
			end
		end,

		keys = {
			{
				"<leader>m<space>",
				"<cmd>AppleMusicPlayPause<cr>",
				desc = "Play / Pause",
			},
			{
				"<leader>mn",
				"<cmd>AppleMusicNext<cr>",
				desc = "Next track",
			},
			{
				"<leader>mp",
				"<cmd>AppleMusicPrev<cr>",
				desc = "Previous track",
			},
			{
				"<leader>mi",
				"<cmd>AppleMusicInfo<cr>",
				desc = "Now playing info",
			},
			{
				"<leader>mr",
				"<cmd>AppleMusicRefresh<cr>",
				desc = "Refresh statusline",
			},
			{
				"<leader>mf",
				"<cmd>AppleMusicToggleFavourite<cr>",
				desc = "Toggle Favourite-ness",
			},
		},

		config = function(_, opts)
			-- This part actually initializes your music plugin with the opts above
			require("apple-music").setup(opts)

			-- This part tells which-key to add the icons to the keys we defined
			local wk = require("which-key")
			wk.add({
				{ "<leader>m", group = "Music", icon = { icon = "󰝚", color = "purple" } },
				{ "<leader>m<space>", icon = { icon = "⏯ ", color = "green" } },
				{ "<leader>mn", icon = { icon = "⏭ ", color = "azure" } },
				{ "<leader>mp", icon = { icon = "⏮ ", color = "azure" } },
				{ "<leader>mr", icon = { icon = "󰑓 ", color = "orange" } },
				{ "<leader>mi", icon = { icon = "󰎆 ", color = "yellow" } },
				{ "<leader>mf", icon = { icon = "󰓎 ", color = "red" } },
			})
		end,
	},
	{
		"tamton-aquib/staline.nvim",
		event = "VeryLazy",
		opts = {
			sections = {
				left = {
					"- ",
					"-mode",
					"left_sep_double",
					"file_name",
					"  ",
					"branch",
				},
				mid = { "lsp" },
				right = {
					-- Apple Music now-playing (empty when nothing is playing)
					function()
						local ok, sl = pcall(require, "apple-music.statusline")
						if not ok then
							return ""
						end
						return sl.component()
					end,
					"  ",
					"cool_symbol",
					"  ",
					vim.bo.fileencoding:upper(),
					"right_sep_double",
					"-line_column",
				},
			},
			defaults = {
				cool_symbol = "  ",
				left_separator = "",
				right_separator = "",
				bg = "#303030",
				full_path = false,
				branch_symbol = " ",
			},
			mode_colors = {
				-- n = "#986fec",
				n = "#d5e285",
				i = "#00d2d2",
				ic = "#e86671",
				c = "#e27d60",
			},
		},
	},
}
