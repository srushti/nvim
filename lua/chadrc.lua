---@type ChadrcConfig
local M = {}

M.ui = {
	theme = "onedark",

	statusline = {
		theme = "default", -- default/vscode/vscode_colored/minimal
		separator_style = "default",
		order = { "mode", "file", "git", "%=", "lsp", "%=", "encoding", "cursor" },
		modules = {
			encoding = function()
				return string.upper(vim.bo.fileencoding ~= "" and vim.bo.fileencoding or vim.o.encoding) .. " "
			end,
		},
	},

	nvdash = {
		load_on_startup = true,
	},
}

M.plugins = "plugins"

return M
