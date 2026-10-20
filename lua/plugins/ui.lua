-- Apple Music now-playing component for staline.
-- Cached for 10s so the statusline doesn't shell out to osascript on every redraw.
local music_cache, music_last = "", 0
local function now_playing()
	if os.time() - music_last < 10 then
		return music_cache
	end
	music_last = os.time()

	local cmd = [[osascript -e '
if application "Music" is running then
	tell application "Music"
		if player state is playing then
			return (name of current track) & " — " & (artist of current track)
		end if
	end tell
end if
return ""' 2>/dev/null]]
	local h = io.popen(cmd)
	if not h then
		music_cache = ""
		return ""
	end
	local out = h:read("*a") or ""
	h:close()
	out = out:gsub("^%s+", ""):gsub("%s+$", "")
	if out == "" or out:find("missing value", 1, true) then
		music_cache = ""
	else
		music_cache = " 󰝚 " .. out
	end
	return music_cache
end

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
			},
			{
				"<leader>ms",
				function()
					require("apple-music").toggle_shuffle()
				end,
				desc = "Toggle [S]huffle",
			},
			{
				"<leader>mp",
				function()
					require("apple-music").select_playlist()
				end,
				desc = "Find [P]laylists",
			},
			{
				"<leader>ma",
				function()
					require("apple-music").select_album()
				end,
				desc = "Find [A]lbum",
			},
			{
				"<leader>ms",
				function()
					require("apple-music").select_track()
				end,
				desc = "Find [S]ong",
			},
			{
				"<leader>mx",
				function()
					require("apple-music").cleanup_all()
				end,
				desc = "Cleanup Temp Playlists",
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
					"git_diff",
					"cwd",
				},
				mid = { "lsp" },
				right = {
					-- Apple Music now-playing (empty when nothing is playing)
					now_playing,
					function()
						return vim.ui.progress_status()
					end,
					"  ",
					"cool_symbol",
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
