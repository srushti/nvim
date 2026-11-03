vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})

vim.api.nvim_create_autocmd({ "BufLeave" }, {
	callback = function()
		local buf = vim.api.nvim_get_current_buf()
		-- Only save if the buffer has a name and has been modified
		if vim.api.nvim_buf_get_name(buf) ~= "" and vim.bo.modified then
			vim.cmd("silent! write")
		end
	end,
})

local lsp_hacks = vim.api.nvim_create_augroup("LspHacks", { clear = true })

vim.api.nvim_create_autocmd({ "BufNewFile", "BufReadPost" }, {
	group = lsp_hacks,
	pattern = ".env*",
	callback = function(e)
		vim.diagnostic.enable(false, { bufnr = e.buf })
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "typescript", "typescriptreact" },
	callback = function()
		vim.opt_local.makeprg = "./node_modules/.bin/tsc | sed 's/(\\(.*\\),\\(.*\\)):/:\\1:\\2:/'"
	end,
})

-- Mirror LSP $/progress onto the terminal's OSC 9;4 progress bar (kitty, ghostty, wezterm, ...)
local function term_progress(state)
	local osc = "\27]9;4;" .. state .. "\7"
	if os.getenv("TMUX") then
		-- DCS passthrough; needs `set -g allow-passthrough on` in tmux
		osc = "\27Ptmux;\27" .. osc .. "\27\\"
	end
	vim.api.nvim_chan_send(2, osc)
end

-- In-flight progress tokens across all clients: key -> percentage (or false if unknown)
local lsp_progress = {}

vim.api.nvim_create_autocmd("LspProgress", {
	group = lsp_hacks,
	callback = function(ev)
		local value = ev.data.params.value or {}
		if not value.kind then
			return
		end

		local key = ev.data.client_id .. ":" .. tostring(ev.data.params.token)
		if value.kind == "end" then
			lsp_progress[key] = nil
		else
			lsp_progress[key] = value.percentage or false
		end

		if next(lsp_progress) == nil then
			term_progress("0")
			return
		end

		-- Show the slowest task; fall back to indeterminate if none report a percentage
		local min
		for _, pct in pairs(lsp_progress) do
			if pct and (not min or pct < min) then
				min = pct
			end
		end
		term_progress(min and ("1;" .. min) or "3")
	end,
})

vim.api.nvim_create_autocmd("VimLeavePre", {
	group = lsp_hacks,
	callback = function()
		term_progress("0")
	end,
})
