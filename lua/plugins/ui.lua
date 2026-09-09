return {
	{
		"p5quared/apple-music.nvim",
		dependencies = {
			"ibhagwan/fzf-lua",
		},
		config = true,
		keys = {
			{
				"<leader>m<space>",
				function()
					require("apple-music").toggle_play()
				end,
				desc = "Toggle Playback",
				color = "green",
			},
			{
				"<leader>ms",
				function()
					require("apple-music").toggle_shuffle()
				end,
				desc = "Toggle [S]huffle",
				color = "yellow",
			},
			{
				"<leader>mp",
				function()
					require("apple-music").select_playlist()
				end,
				desc = "Find [P]laylists",
				color = "red",
			},
			{
				"<leader>ma",
				function()
					require("apple-music").select_album()
				end,
				desc = "Find [A]lbum",
				color = "red",
			},
			{
				"<leader>ms",
				function()
					require("apple-music").select_track()
				end,
				desc = "Find [S]ong",
				color = "red",
			},
			{
				"<leader>mx",
				function()
					require("apple-music").cleanup_all()
				end,
				desc = "Cleanup Temp Playlists",
				color = "grey",
			},
		},
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
					function()
						return vim.ui.progress_status()
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
