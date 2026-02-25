require "nvchad.mappings"

local map = vim.keymap.set

map("n", "<leader>w", ":w<cr>", { noremap = true, silent = true, desc = "Save file" })

map(
	"n",
	"<leader><c-s>",
	":TSHighlightCapturesUnderCursor<CR>",
	{ desc = "Check highlights", silent = true }
)
map("i", "uu", "_", { desc = "Insert mode underscore", silent = true })
map("i", "hh", "=>", { desc = "Insert mode hashrocket", silent = true })
map("i", "--", "->", { desc = "Insert mode arrow", silent = true })
map("i", "aa", "@", { desc = "Insert mode @", silent = true })

map("n", "<Enter>", "o<esc>", { desc = "Insert newline below", silent = true })
map("n", "<C-j>", "ddp", { desc = "Move line down" })
map("n", "<C-k>", "kddpk", { desc = "Move line up" })

map("t", "<Esc>", "<C-\\><C-n>", { noremap = true, silent = true, desc = "Exit terminal mode" })

-- Which-key groups
local wk = require("which-key")
wk.add({
	{ "<leader>i", group = "Interactive" },
	{ "<leader>G", group = "Git" },
	{ "<leader>z", group = "Zk" },
	{ "<leader>a", group = "AI" },

	{ "<leader>iT", icon = "$" },
	{ "<leader>iF", icon = "$" },
})

-- Format command
vim.api.nvim_create_user_command("Format", function(args)
	local range = nil
	if args.count ~= -1 then
		local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
		range = {
			start = { args.line1, 0 },
			["end"] = { args.line2, end_line:len() },
		}
	end
	require("conform").format({ async = true, lsp_format = "fallback", range = range })
end, { range = true })
